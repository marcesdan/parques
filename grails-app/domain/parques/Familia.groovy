package parques

class Familia {

    String nombre

    static belongsTo = [orden: Orden]

    static mapping = {
        orden cascade: "save-update"
        nombre index: "nombre_idx"
    }
    static constraints = {
        nombre unique: true
    }
}
