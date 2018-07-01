package parques

class HelperController {

    HelperService helperService

    private renderJson(result) {
        render(contentType: "application/json") {
            results(result) { obj ->
                id obj.id
                text obj.toString()
            }
        }
    }

    def getClases(String str) {
        renderJson(helperService.getClases(str))
    }

    def getOrdenes(String str) {
        renderJson(helperService.getOrdenes(str))
    }

    def getFamilias(String str) {
        renderJson(helperService.getFamilias(str))
    }

    def getGeneros(String str) {
        renderJson(helperService.getGeneros(str))
    }

    def getEspeciesPorNombreCientifico(String str) {
        renderJson(helperService.getEspeciesPorNombreCientifico(str))
    }
}
