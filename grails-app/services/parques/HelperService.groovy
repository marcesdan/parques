package parques

import grails.gorm.transactions.Transactional

@Transactional(readOnly = true)
class HelperService {

    List getClases(String str) {
        Clase.findAllByNombreLike("${str}%", [ sort: 'nombre', order: 'asc'])
    }

    List getOrdenes(String str) {
        Orden.findAllByNombreLike("${str}%", [ sort: 'nombre', order: 'asc'])
    }

    List getFamilias(String str) {
        Familia.findAllByNombreLike("${str}%", [ sort: 'nombre', order: 'asc'])
    }
}
