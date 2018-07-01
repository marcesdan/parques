package parques

class Orden {

    String nombre

    static belongsTo = [clase: Clase]
    static mapping = {
        clase cascade: "save-update", lazy: false
        nombre index: "nombre_idx"
    }

    static constraints = {
        nombre unique: true
    }

    @Override
    String toString() {
    	nombre
    }
}
