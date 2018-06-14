package parques

import groovy.json.JsonSlurper

class BootStrap {

    def init = { servletContext ->

        /*
        def endpoint = "ficha-area-protegida/areas-protegidas"
        data(endpoint).each {
            if (it.jurisdiccion == "APN") {
                def x = 0
                def areaProtegida = new AreaProtegida(it as Map)  // low-ceremony
                endpoint = "ficha-area-protegida/$it.slug/datos-basicos"
                // se realizan las asociaciones del AP con sus objetivos
                data(endpoint).objetivos.each {
                    def objetivo = Objetivo.findByDescripcion(it)
                    objetivo ?
                            areaProtegida.addToObjetivos(objetivo) :
                            areaProtegida.addToObjetivos(new Objetivo(descripcion: it))
                }
                areaProtegida.save(failOnError: true, flush: true)

                endpoint = "ficha-area-protegida/$it.slug/especies"
                // se realizan las asociaciones del AP con las especies
                data(endpoint).each {
                    def especie = Especie.findByEspecie(it.especie)
                    if (!especie) {
                        // it.genero es un string y el contstructor de especie va a fallar (necesita una referencia)
                        def strGenero = it.genero
                        it.genero = null
                        especie = new Especie(it as Map)

                        // usar una cadena para un booleano no parece algo alegre...
                        especie.setEndemica(it.endemica == "1")

                        def genero = Genero.findByNombre(strGenero)
                        if (!genero) {
                            genero = new Genero(nombre: strGenero)
                            def familia = Familia.findByNombre(it.familia)
                            if (!familia) {
                                familia = new Familia(nombre: it.familia)
                                def orden = Orden.findByNombre(it.orden)
                                if (!orden) {
                                    orden = new Orden(nombre: it.orden)
                                    def clase = Clase.findByNombre(it.clase)
                                    if (!clase) {
                                        clase = new Clase(nombre: it.clase)
                                    }
                                    orden.clase = clase
                                }
                                familia.orden = orden
                            }
                            genero.familia = familia
                        }
                        especie.genero = genero
                        especie.save(failOnError: true, flush: true)
                    }
                    areaProtegida.addToEspecies(especie)
                }
                areaProtegida.save(failOnError: true, flush: true)
                println(x++)
            }
        }
        */
    }

    def destroy = {
    }
}
