package parques

class Imagen {

    String url

    static belongsTo = [especie:Especie]
    static constraints = {
    }
}
