package parques

class PublicoAreaController {

    AreaProtegidaService areaProtegidaService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    /* Parte publica*/
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond areaProtegidaService.list(params),
                model: [areaProtegidaCount: areaProtegidaService.count()],
                view: '/publico/index'
    }

    def show(Long id) {
        respond areaProtegidaService.get(id),
                view: '/publico/areaProtegida/show'
    }

}
