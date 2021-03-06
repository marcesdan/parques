package parques.privado

import grails.converters.JSON
import grails.validation.ValidationException
import parques.AreaProtegida
import parques.AreaProtegidaService
import parques.ParqueService
import static org.springframework.http.HttpStatus.*
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class AreaProtegidaController {

    static namespace = "privado"

    AreaProtegidaService areaProtegidaService
    ParqueService parqueService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", cargarDatos: "POST"]

    def index(Integer max) {
        //params.max = Math.min(max ?: 10, 100)
        respond areaProtegidaService.list(params),
                model: [areaProtegidaCount: areaProtegidaService.count()]
    }

    def show(String slug) {
        respond areaProtegidaService.findBySlug(slug)
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
            areaProtegidaService.save(areaProtegida, params)
        } catch (ValidationException e) {
            respond areaProtegida.errors, view: 'create'
            return
        }
        
        request.withFormat {
            form multipartForm {
                flash.message = "${areaProtegida.parque} creado con éxito!"
                redirect uri: '/admin'
            }
            '*' { respond areaProtegida, [status: CREATED] }
        }
    }

    def edit(String slug) {
        respond areaProtegidaService.findBySlug(slug)
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
                flash.message = "${areaProtegida.parque} editado con éxito"
                redirect uri: '/admin'
            }
            '*' { respond areaProtegida, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            //notFound()
            render([success: false] as JSON)
        }

        areaProtegidaService.delete(id)

        render([success: true] as JSON)

        /*
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'areaProtegida.label', default: 'AreaProtegida'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
        */
    }

    def cargarDatos() {
        try {
            parqueService.cargarDatos()
            render([success: true] as JSON)
        } catch (def e) {
            render([success: false] as JSON)
        }
    }

    def agregarEspecies() {
        try {
            def especies = JSON.parse(params.especies)
            respond areaProtegidaService.agregarEspecies(especies,params.id), view: '/publico/especie/index'
        }
        catch(Exception e) {
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'areaProtegida.label', default: 'AreaProtegida'), params.id])
                redirect uri: '/admin'
            }
            '*' { render status: NOT_FOUND }
        }
    }

}
