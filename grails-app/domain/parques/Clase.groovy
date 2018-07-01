package parques

class Clase {

    String nombre

    static constraints = {
        nombre unique: true
    }

    static mapping = {
        nombre index: "nombre_idx"
    }

    @Override
    String toString() {
    	nombre
    }
}
