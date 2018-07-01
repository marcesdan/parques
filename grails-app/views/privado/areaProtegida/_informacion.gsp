<div class="row">
  <div class="col-lg-8 mt-3">
    <div class="form-row">
      <div class="form-group col-sm-8">
        <label for="parque">Área protegida</label>
         <input type="text" name="parque" class="form-control" value="${areaProtegida.parque}" disabled>
      </div>
      <div class="form-group col-sm-4">
        <label for="ano_creacion">Año de creación</label>
        <input type="number" class="form-control" name="ano_creacion" value="${areaProtegida.ano_creacion}" disabled>
      </div>
    </div>
    <div class="form-row">
      <div class="form-group col-md-4">
        <label for="delegacion">Delegacion</label>
        <input type="text" class="form-control" name="delegacion" value="${areaProtegida.delegacion}" disabled>
      </div>
      <div class="form-group col-md-4">
        <label for="provincia">Provincia</label>
        <input type="text" class="form-control" name="provincia" value="${areaProtegida.provincia}" disabled>
      </div>
      <div class="form-group col-md-4">
        <label for="localidad">Localidad</label>
        <input type="text" class="form-control" name="localidad" value="${areaProtegida.localidad}" disabled>
      </div>
    </div>
    <div class="form-row">
      <div class="form-group col-sm-4">
        <label for="lat">Latitud</label>
         <input type="number" name="lat" class="form-control" value="${areaProtegida.lat}" disabled>
      </div>
      <div class="form-group col-sm-4">
        <label for="lng">Longitud</label>
         <input type="number" name="lng" class="form-control" value="${areaProtegida.lng}" disabled>
      </div>
      <div class="form-group col-sm-4">
        <label for="superficie">Superficie</label>
        <input type="number" class="form-control" name="superficie" value="${areaProtegida.superficie}" disabled>
      </div>
    </div>
    <div class="form-group">
        <label for="objetivo">Objetivo</label>
        <textarea class="form-control" name="objetivo" rows="3" disabled>${areaProtegida.objetivo}</textarea>
    </div>
  </div>
  <div class="col-lg-4">
    <div class="row">
      <div class="mt-2 mx-auto d-block">
        <img class="img-fluid rounded-circle" src="${areaProtegida.logo?.url}" width="150" height="150">
      </div>
      <div class="mt-2 mx-auto d-block">
        <img class="img-fluid" src="${areaProtegida.imagen_principal?.url}" width="320" height="320">  
      </div>
    </div>
  </div>
  <div class="form-group mx-auto d-block pt-2">
      <button type="button" class="btn btn-warning mr-2 text-white">Editar</button>
      <button type="button" class="btn btn-danger ml-2">Eliminar</button>
  </div>
</div>