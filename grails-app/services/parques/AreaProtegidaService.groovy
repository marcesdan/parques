package parques

import grails.gorm.services.Service
import groovy.transform.CompileDynamic

@Service(AreaProtegida)
abstract class AreaProtegidaService {

    abstract AreaProtegida get(Serializable id)

    abstract List<AreaProtegida> list(Map args)

    abstract Long count()

    abstract void delete(Serializable id)

    abstract AreaProtegida save(AreaProtegida areaProtegida)

    abstract AreaProtegida findBySlug(String slug)

    def listEspecies(Map params) {
        def areaProtegida = this.findBySlug(params.slug)
        return areaProtegida.especies.findAll {
            def truth = true
            if (params.reino) truth = params.reino == it.reino
            if (params.clase) truth &= params.clase == it.genero.familia.orden.clase
            if (params.familia) truth &= params.familia == it.genero.familia
            if (params.orden) truth &= params.orden == it.genero.familia.orden
            if (params.origen) truth &= params.origen == it.origen
            truth
        }
    }
}
