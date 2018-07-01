<div class="form-row">
  <div class="form-group col-sm-4">
    <label for="genero">Género <i class="fas fa-asterisk fa-xs text-muted"></i></label>
     <select class="select-genero js-states filtro form-control form-control-lg" name="genero" value="${especie.genero}"></select>
  </div>
  <div class="form-group col-sm-4">
    <label for="especie">Especie <i class="fas fa-asterisk fa-xs text-muted"></i></label>
    <input type="text" class="form-control" name="especie" value="${especie.especie}">
  </div>
  <div class="form-group col-sm-4">
    <label for="nombre_cientifico">Nombre científico</label>
    <input type="text" class="form-control" name="nombre_cientifico" value="${especie.genero} ${especie.especie}" hidden>
  </div>
</div>
<div class="form-row">
  <div class="form-group col-md-4">
    <label for="reino">Reino <i class="fas fa-asterisk fa-xs text-muted"></i></label>
    <select class="form-control" name="reino">
      <option value="${especie.reino}">${especie.reino}</option>
      <option value="ANIMALIA">ANIMALIA</option>
      <option value="BACTERIA">BACTERIA</option>
      <option value="FUNGI">FUNGI</option>
      <option value="PLANTAE">PLANTAE</option>
    </select>
  </div>
  <div class="form-group col-md-4">
    <label for="origen">Origen</label>
    <input type="text" class="form-control" name="origen" value="${especie.origen}">
  </div>
  <div class="form-group col-md-4">
    <label for="nombre_comun">Nombre común</label>
    <input type="text" class="form-control" name="nombre_comun" value="${especie.nombre_comun}">
  </div>
</div>
<div class="form-row">
    <label for="imagen_principal">Imagen principal</label>
    <input type="text" class="form-control" name="imagen_principal.url" value="${especie.imagen_principal?.url}">
</div>
<div class="form-group text-center pt-2">
  <button name="create" type="submit" class="btn btn-success mr-2">Guardar</button>
  <button type="button" class="btn btn-danger ml-2">Volver</button>
</div>