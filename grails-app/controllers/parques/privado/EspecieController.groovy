package parques.privado

import grails.converters.JSON
import grails.validation.ValidationException
import parques.Especie
import parques.EspecieService
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
import static org.springframework.http.HttpStatus.*

class EspecieController {

    EspecieService especieService

    static namespace = "privado"
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        //params.max = Math.min(max ?: 10, 100)
        respond especieService.list(params), model:[especieCount: especieService.count()]
    }

    def show(Long id) {
        respond especieService.get(id)
    }

    def create() {
        respond new Especie(params)
    }

    def save(Especie especie) {
        if (especie == null) {
            notFound()
            return
        }

        try {
            println(especie as JSON)
            especieService.save(especie)
        } catch (ValidationException e) {
            respond especie.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'especie.label', default: 'Especie'), especie.id])
                redirect especie
            }
            '*' { respond especie, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond especieService.get(id)
    }

    def update(Especie especie) {
        if (especie == null) {
            notFound()
            return
        }

        try {
            especieService.save(especie)
        } catch (ValidationException e) {
            respond especie.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'especie.label', default: 'Especie'), especie.id])
                redirect especie
            }
            '*'{ respond especie, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        especieService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'especie.label', default: 'Especie'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'especie.label', default: 'Especie'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
