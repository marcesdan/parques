package parques

import groovy.json.JsonSlurper

class ParqueService {

    /* Sets donde se insertaran los registros, tanto para impedir introducir duplicados en la BD
    * como para no tener que hacer lecturas en disco con el mismo fin. Algo asi como un buffer... */
    private HashSet<String> objetivos = [], especies = [], generos = [], familias = [], ordenes = [], clases = []

    private final jsonSlurper = new JsonSlurper()

    private getData(endpoint) {
        jsonSlurper.parse(new URL("https://sib.gob.ar/api/2.0.0/" + endpoint))
    }

    private ceroToNull(str) {
        str != "0" ? str : null
    }

    private initAreaProtegida(areaProtegidaMap) {
        areaProtegidaMap.ano_creacion = ceroToNull areaProtegidaMap.ano_creacion
        areaProtegidaMap.superficie = ceroToNull areaProtegidaMap.superficie
        areaProtegidaMap.lat = areaProtegidaMap.lat as Float ?: null
        areaProtegidaMap.lng = areaProtegidaMap.lng as Float ?: null
        areaProtegidaMap.superficie = ceroToNull areaProtegidaMap.superficie
    }

    void cargarDatos() {
        def contador = 0
        getData("ficha-area-protegida/areas-protegidas").each { areaProtegidaMap ->
            if (areaProtegidaMap.jurisdiccion == "APN") {
                initAreaProtegida(areaProtegidaMap)
                def areaProtegida = new AreaProtegida(areaProtegidaMap)
                // se realizan las asociaciones del AP con sus objetivos
                getData("ficha-area-protegida/$areaProtegidaMap.slug/datos-basicos").objetivos.each { objetivo ->
                    areaProtegida.addToObjetivos(
                            //Si lo puede agregar es porque aun no se ha creado (aplica para todos los "buffers")
                            objetivos.add(objetivo) ?
                                    new Objetivo(descripcion: objetivo) :
                                    Objetivo.findByDescripcion(objetivo)
                    )
                }
                // se realizan las asociaciones del AP con las index
                getData("ficha-area-protegida/$areaProtegidaMap.slug/index").each { especieMap ->
                    // el constructor de Especie espera una referencia a Genero, no un string...
                    def strGenero = especieMap.genero
                    especieMap.genero = null
                    //un enfoque bottom-up
                    def getOrden = {
                        new Orden(
                                nombre: especieMap.orden.toUpperCase(),
                                clase: clases.add(especieMap.clase.toUpperCase()) ?
                                        new Clase(nombre: especieMap.clase.toUpperCase()) :
                                        Clase.findByNombre(especieMap.clase.toUpperCase())
                        )
                    }
                    def getFamilia = {
                        new Familia(
                                nombre: especieMap.familia,
                                orden: ordenes.add(especieMap.orden.toUpperCase()) ?
                                        getOrden() :
                                        Orden.findByNombre(especieMap.orden.toUpperCase())
                        )
                    }
                    def getGenero = {
                        new Genero(
                                nombre: strGenero,
                                familia: familias.add(especieMap.familia) ?
                                        getFamilia() :
                                        Familia.findByNombre(especieMap.familia)
                        )
                    }
                    /* Aca comienza la llamada encadenada a las closures, asegurando que NO habrá index/géneros/etc repetidos
                    * y realizando lecturas en disco solo para recuperar los registros persistidos, con la certeza de
                    * que ya existen (no para comprobar su existencia) */
                    def especie = especies.add(especieMap.nombre_cientifico) ?
                            new Especie(especieMap).with {
                                genero = generos.add(strGenero) ?
                                        getGenero() :
                                        Genero.findByNombre(strGenero)
                                it //retorna una referencia a la nueva especie
                            } : Especie.findByNombre_cientifico(especieMap.nombre_cientifico)

                    // De ser necesario crea en cascada su género, familia, orden y clase
                    especie.save(failOnError: true)
                    areaProtegida.addToEspecies(especie)
                }
                areaProtegida.save(failOnError: true, flush: true)
                println("${++contador}) ${areaProtegidaMap.parque} creado con éxito!!!")
            }
        }
    }
}
