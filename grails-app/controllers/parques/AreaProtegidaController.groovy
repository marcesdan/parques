package parques

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class AreaProtegidaController {

    AreaProtegidaService areaProtegidaService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond areaProtegidaService.list(params),
                model: [areaProtegidaCount: areaProtegidaService.count()]
    }

    def show(Long id) {
        respond areaProtegidaService.get(id)
    }

    def create() {
        respond new AreaProtegida(params)
    }

    def save(AreaProtegida areaProtegida) {
        if (areaProtegida == null) {
            notFound()
            return
        }

        try {
            areaProtegidaService.save(areaProtegida)
        } catch (ValidationException e) {
            respond areaProtegida.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'areaProtegida.label', default: 'AreaProtegida'), areaProtegida.id])
                redirect areaProtegida
            }
            '*' { respond areaProtegida, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond areaProtegidaService.get(id)
    }

    def update(AreaProtegida areaProtegida) {
        if (areaProtegida == null) {
            notFound()
            return
        }

        try {
            areaProtegidaService.save(areaProtegida)
        } catch (ValidationException e) {
            respond areaProtegida.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'areaProtegida.label', default: 'AreaProtegida'), areaProtegida.id])
                redirect areaProtegida
            }
            '*' { respond areaProtegida, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        areaProtegidaService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'areaProtegida.label', default: 'AreaProtegida'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'areaProtegida.label', default: 'AreaProtegida'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
