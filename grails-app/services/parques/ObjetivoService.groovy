package parques

import grails.gorm.services.Service

@Service(Objetivo)
interface ObjetivoService {

    Objetivo get(Serializable id)

    List<Objetivo> list(Map args)

    Long count()

    void delete(Serializable id)

    Objetivo save(Objetivo objetivo)

}