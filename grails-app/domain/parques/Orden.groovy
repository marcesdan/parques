package parques

class Orden {

    String nombre

    static belongsTo = [clase: Clase]
    static mapping = {
        clase cascade: "save-update"
    }

    static constraints = {
        nombre unique: true
    }
}
