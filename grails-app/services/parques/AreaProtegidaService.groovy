package parques

import grails.gorm.services.Service
import groovy.json.JsonSlurper

@Service(AreaProtegida)
abstract class AreaProtegidaService implements IAreaProtegidaService {

    @Override
    Set<Especie> listEspecies(Serializable id) {
        def areaProtegida = AreaProtegida.get(id)
        def especies = areaProtegida.especies
    }

    @Override
    void cargarDatos() {

        def base = "https://sib.gob.ar/api/2.0.0/"
        def data = { endpoint ->
            new JsonSlurper().parse(new URL(base + endpoint))
        }
        //Buffers
        HashSet<String> objetivos = especies = generos = familias = ordenes = clases = []

        def endpoint = "ficha-area-protegida/areas-protegidas"
        data(endpoint).each {
            if (it.jurisdiccion == "APN") {
                def areaProtegida = new AreaProtegida(it as Map)  // low-ceremony
                endpoint = "ficha-area-protegida/$it.slug/datos-basicos"
                // se realizan las asociaciones del AP con sus objetivos
                data(endpoint).objetivos.each {
                    areaProtegida.addToObjetivos(
                            // Si lo puede agregar es porque aun no se ha creado
                            objetivos.add(it) ?
                                    new Objetivo(descripcion: it) :
                                    Objetivo.findByDescripcion(it)
                    )
                }
                endpoint = "ficha-area-protegida/$it.slug/especies"
                // se realizan las asociaciones del AP con las especies
                data(endpoint).each {
                    if (especies.add(it.especie)) {
                        // it.genero es un string y el contstructor de especie va a fallar (necesita una referencia)
                        def strGenero = it.genero
                        it.genero = null
                        // usar una cadena para un booleano no parece algo alegre...
                        def especie = new Especie(it as Map)
                                .setEndemica(it.endemica == "1")
                        if (generos.add(strGenero)) {
                            def genero = new Genero(nombre: strGenero)
                            if (familias.add(it.familia)) {
                                def familia = new Familia(nombre: it.familia)
                                if (ordenes.add(it.orden)) {
                                    def orden = new Orden(nombre: it.orden)

                                    orden.clase = clases.add(it.clase) ?
                                            new Clase(nombre: it.clase) :
                                            Clase.findByNombre(it.clase)

                                } else def orden = Orden.findByNombre(it.orden)
                                familia.orden = orden
                            } else def familia = Familia.findByNombre(it.familia)
                            genero.familia = familia
                        } else def genero = Genero.findByNombre(it.especie)
                        especie.genero = genero
                    } else def especie = Especie.findByEspecie(it.especie)
                    areaProtegida.addToEspecies(especie)
                }
                areaProtegida.save(failOnError: true, flush: true)
                println('un area más!')
            }
        }
    }
}