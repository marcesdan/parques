package parques

class Clase {

    String nombre

    static constraints = {
        nombre unique: true, blank: false
    }
}
