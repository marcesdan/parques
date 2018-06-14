package parques.publico

import grails.converters.JSON
import parques.AreaProtegidaService

class AreaProtegidaController {

    static namespace = 'publico'
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    AreaProtegidaService areaProtegidaService

    /* Parte publica*/
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond areaProtegidaService.list(params),
                model: [areaProtegidaCount: areaProtegidaService.count()]
    }

    def show(Long id) {
        respond areaProtegidaService.get(id)
    }

    def showEspecies(Long id) {
        render([areaProtegidaService.listEspecies(id)] as JSON)
    }
}
