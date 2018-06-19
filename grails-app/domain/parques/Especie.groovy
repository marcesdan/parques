package parques

class Especie {

    String especie, nombre_cientifico, origen, nombre_comun, reino
    Genero genero
    PortadaEspecie imagen_principal
    Collection areasProtegidas

    static belongsTo = [AreaProtegida, Genero]
    static hasMany = [areasProtegidas: AreaProtegida, imagenes: Imagen, sonidos: Sonido]

    static constraints = {
        nombre_cientifico unique: true
        nombre_comun nullable: true
        reino inList: ["ANIMALIA", "BACTERIA", "FUNGI", "PLANTAE"]
        imagen_principal nullable: true
    }

    static mapping = {
        especie index: "especie_idx"
        nombre_cientifico index: "nombre_cientifico_idx"
        nombre_comun index: "nombre_comun_idx"
        genero cascade: "save-update"
        imagen_principal lazy: false
        imagenes column: "especie_id", joinTable: false
        sonidos column: "especie_id", joinTable: false
    }
}
