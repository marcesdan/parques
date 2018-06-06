package parques

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class ImagenController {

    ImagenService imagenService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond imagenService.list(params), model:[imagenCount: imagenService.count()]
    }

    def show(Long id) {
        respond imagenService.get(id)
    }

    def create() {
        respond new PortadaArea(params)
    }

    def save(PortadaArea imagen) {
        if (imagen == null) {
            notFound()
            return
        }

        try {
            imagenService.save(imagen)
        } catch (ValidationException e) {
            respond imagen.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'imagen.label', default: 'PortadaArea'), imagen.id])
                redirect imagen
            }
            '*' { respond imagen, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond imagenService.get(id)
    }

    def update(PortadaArea imagen) {
        if (imagen == null) {
            notFound()
            return
        }

        try {
            imagenService.save(imagen)
        } catch (ValidationException e) {
            respond imagen.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'imagen.label', default: 'PortadaArea'), imagen.id])
                redirect imagen
            }
            '*'{ respond imagen, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        imagenService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'imagen.label', default: 'PortadaArea'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagen.label', default: 'PortadaArea'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
