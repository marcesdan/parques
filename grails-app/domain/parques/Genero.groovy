package parques

class Genero {

    String nombre

    static belongsTo = [familia: Familia]

    static mapping = {
        familia cascade: "save-update", lazy: false
        nombre index: "nombre_idx"
    }

    static constraints = {
        nombre unique: true
    }
}
