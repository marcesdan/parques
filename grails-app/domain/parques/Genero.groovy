package parques

class Genero {

    String nombre

    static belongsTo = [familia: Familia]

    static mapping = {
        familia cascade: "save-update"
        nombre index: "nombre_idx"
    }

    static constraints = {
        nombre unique: true
    }
}
