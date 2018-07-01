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

    List getGeneros(String str) {
        Genero.findAllByNombreLike("${str}%", [ sort: 'nombre', order: 'asc'])
    }

    List getEspeciesPorNombreCientifico(String nombreCientifico) {
        Especie.where {
            nombre_cientifico ==~ "${nombreCientifico}%"
        }.list(sort:"nombre_cientifico", order: "asc")
    }
}
