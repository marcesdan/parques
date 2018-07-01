package parques

import grails.gorm.services.Service

@Service(AreaProtegida)
abstract class AreaProtegidaService {

    abstract AreaProtegida get(Serializable id)

    abstract Long count()

    abstract void delete(Serializable id)

    abstract AreaProtegida findBySlug(String slug)

    abstract AreaProtegida save(AreaProtegida areaProtegida)

    abstract List<AreaProtegida> list(Map args)

    List<AreaProtegida> filtrar(Map args) {
        // así, en el futuro, se podría filtrar por más de un solo argumento
        args.region ? 
        AreaProtegida.all.findAll { 
            it.delegacion == args.region 
        } : this.list()
    }

    AreaProtegida save(AreaProtegida ap, Map params) {
        ap.logo = new Logo()
        ap.imagen_principal = new PortadaArea()
        ap.imagen_principal.url = params.imagen_principal.url
        ap.logo.url = params.imagen_principal.url
        ap.slug = ap.parque.split().join('-')
        ap.save()
    }

    List<Especie> listEspecies(Map params) {
        AreaProtegida areaProtegida = this.findBySlug(params.slug)
        areaProtegida.especies.findAll {
            def truth = true
            if (params.reino) truth = params.reino == it.reino
            if (params.clase) truth &= params.clase == it.genero.familia.orden.clase
            if (params.familia) truth &= params.familia == it.genero.familia
            if (params.orden) truth &= params.orden == it.genero.familia.orden
            if (params.origen) truth &= params.origen == it.origen
            truth
        }
    }

    List<Especie> agregarEspecies(especies, id) {
        List<Especie> aux = []
        def areaProtegida = this.get(id)
        especies.each {
            Especie especie = Especie.get(it)
            areaProtegida.addToEspecies(especie)    
            aux.add(especie)
        }
        areaProtegida.save()
        aux
    }
}
