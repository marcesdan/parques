package parques

import grails.gorm.services.Service

@Service(AreaProtegida)
interface AreaProtegidaService {

    AreaProtegida get(Serializable id)

    List<AreaProtegida> list(Map args)

    Long count()

    void delete(Serializable id)

    AreaProtegida save(AreaProtegida areaProtegida)
}
