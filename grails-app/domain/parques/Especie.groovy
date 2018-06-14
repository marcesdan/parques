package parques

class Especie {

    String especie, nombre_cientifico, origen, nombre_comun
    Boolean endemica
    Genero genero
    PortadaEspecie imagen_principal

    static belongsTo = [AreaProtegida, Genero]
    static hasMany = [areasProtegidas: AreaProtegida, imagenes: Imagen, sonidos: Sonido]

    static constraints = {
        especie()
        nombre_cientifico()
        origen()
        nombre_comun shared: "strNullable"
        endemica()
        genero()
        imagen_principal nullable: true
    }

    static mapping = {
        genero cascade: "save-update"
        imagen_principal lazy: false
        imagenes column: "especie_id", joinTable: false
        sonidos column: "especie_id", joinTable: false
    }
}
