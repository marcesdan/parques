package parques

class Sonido {

    String url

    static belongsTo = [especie:Especie]

    static constraints = {
    }
}
