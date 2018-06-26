package parques.publico

import parques.AreaProtegidaService
import parques.Especie

class AreaProtegidaController {

    static namespace = "publico"
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    AreaProtegidaService areaProtegidaService

    /* Parte publica*/
    def index(Integer max) {
        //params.max = Math.min(max ?: 10, 100)
        respond areaProtegidaService.list(params),
                model: [areaProtegidaCount: areaProtegidaService.count()]
    }

    def show(String slug) {
        respond areaProtegidaService.findBySlug(slug)
    }

    def showEspecies() {
        //respond areaProtegidaService.listEspecies(params), view: '/publico/especie/index', formats: ['json']
        render(view: '/publico/especie/index', especieList: areaProtegidaService.listEspecies(params))
    }
}
