package parques

interface IAreaProtegidaService {

    AreaProtegida get(Serializable id)

    List<AreaProtegida> list(Map args)

    Long count()

    void delete(Serializable id)

    AreaProtegida save(AreaProtegida areaProtegida)

    Set<Especie> listEspecies(Serializable id)

    void cargarDatos()
}
