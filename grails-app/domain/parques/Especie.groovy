package parques

class Especie {

    String especie,
           nombre_cientifico,
           origen,
           nombre_comun
    Boolean endemica
    PortadaEspecie imagen_principal
    Genero genero

    static belongsTo = [AreaProtegida, Genero]
    static hasMany = [areasProtegidas: AreaProtegida, imagenes: Imagen, sonidos: Sonido]

    static mapping = {
        genero cascade: "save-update"
    }

    static constraints = {
        nombre_comun nullable: true
        imagen_principal nullable: true
    }
}
