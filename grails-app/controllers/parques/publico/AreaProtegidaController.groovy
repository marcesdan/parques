package parques.publico

import parques.AreaProtegidaService

class AreaProtegidaController {

    static namespace = "publico"
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    AreaProtegidaService areaProtegidaService

    def index() {
        respond areaProtegidaService.filtrar(params)
    }

    def show(String slug) {
        respond areaProtegidaService.findBySlug(slug)
    }

    def filtrar() {
        respond view: '/publico/areaProtegida/index', areaProtegidaService.filtrar(params)
    }
}
