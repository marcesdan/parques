package parques

import grails.gorm.services.Service

@Service(PortadaArea)
interface ImagenService {

    PortadaArea get(Serializable id)

    List<PortadaArea> list(Map args)

    Long count()

    void delete(Serializable id)

    PortadaArea save(PortadaArea imagen)

}