package parques

class Familia {

    String nombre

    static belongsTo = [orden: Orden]

    static mapping = {
        orden cascade: "save-update"
    }
    static constraints = {
        nombre unique: true
    }
}
