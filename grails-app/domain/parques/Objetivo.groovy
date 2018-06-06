package parques

class Objetivo {

    String descripcion

    static belongsTo = AreaProtegida
    static hasMany = [areasProtegidas: AreaProtegida]

    static constraints = {
        descripcion unique: true
    }
}
