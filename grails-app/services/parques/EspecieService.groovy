package parques

import grails.gorm.services.Service

@Service(Especie)
interface EspecieService {

    Especie get(Serializable id)

    List<Especie> list(Map args)

    Long count()

    void delete(Serializable id)

    Especie save(Especie especie)

}