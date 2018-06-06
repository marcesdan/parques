package parques

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ObjetivoController {

    ObjetivoService objetivoService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond objetivoService.list(params), model:[objetivoCount: objetivoService.count()]
    }

    def show(Long id) {
        respond objetivoService.get(id)
    }

    def create() {
        respond new Objetivo(params)
    }

    def save(Objetivo objetivo) {
        if (objetivo == null) {
            notFound()
            return
        }

        try {
            objetivoService.save(objetivo)
        } catch (ValidationException e) {
            respond objetivo.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'objetivo.label', default: 'Objetivo'), objetivo.id])
                redirect objetivo
            }
            '*' { respond objetivo, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond objetivoService.get(id)
    }

    def update(Objetivo objetivo) {
        if (objetivo == null) {
            notFound()
            return
        }

        try {
            objetivoService.save(objetivo)
        } catch (ValidationException e) {
            respond objetivo.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'objetivo.label', default: 'Objetivo'), objetivo.id])
                redirect objetivo
            }
            '*'{ respond objetivo, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        objetivoService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'objetivo.label', default: 'Objetivo'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetivo.label', default: 'Objetivo'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
