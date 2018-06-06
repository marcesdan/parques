package parques

class Genero {

    String nombre

    static belongsTo = [familia: Familia]

    static mapping = {
        familia cascade: "save-update"
    }

    static constraints = {
        nombre unique: true
    }
}
