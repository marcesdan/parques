package parques.publico

import parques.AreaProtegidaService

class EspecieController {

    static namespace = "publico"

    AreaProtegidaService areaProtegidaService

    def index() {
        respond areaProtegidaService.listEspecies(params), view: '/publico/especie/index'
    }
}
