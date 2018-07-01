<div class="form-row">
  <div class="form-group col-sm-8 ${hasErrors(field:'parque', 'text-danger')}">
    <label for="parque">Área protegida <i class="fas fa-asterisk fa-xs text-muted"></i></label>
     <input type="text" name="parque" class="form-control ${hasErrors(field:'parque', 'is-invalid')}" value="${areaProtegida.parque}">
  </div>
  <div class="form-group col-sm-4">
    <label for="ano_creacion">Año de creación</label>
    <input type="number" class="form-control" name="ano_creacion" value="${areaProtegida.ano_creacion}">
  </div>
</div>
<div class="form-row">
  <div class="form-group col-md-4">
    <label for="delegacion">Delegacion <i class="fas fa-asterisk fa-xs text-muted"></i></label>
    <select class="custom-select" value="${areaProtegida.delegacion}" name="delegacion">
      <option value="${areaProtegida.delegacion}">${areaProtegida.delegacion}</option>
      <option value="CENTRO">CENTRO</option>
      <option value="CENTRO ESTE">CENTRO ESTE</option>
      <option value="NEA">NEA</option>
      <option value="NOA">NOA</option>
      <option value="PATA NORTE">PATA NORTE</option>
      <option value="PATA SUR">PATA SUR</option>
    </select>
  </div>
  <div class="form-group col-md-4">
    <label for="provincia">Provincia <i class="fas fa-asterisk fa-xs text-muted"></i></label>
    <input type="text" class="form-control" name="provincia" value="${areaProtegida.provincia}">
  </div>
  <div class="form-group col-md-4">
    <label for="localidad">Localidad</label>
    <input type="text" class="form-control" name="localidad" value="${areaProtegida.localidad}">
  </div>
</div>
<div class="form-row">
  <div class="form-group col-sm-4">
    <label for="lat">Latitud <i class="fas fa-asterisk fa-xs text-muted"></i></label>
     <input type="number" name="lat" class="form-control ${hasErrors(field:'lat','is-invalid')}" value="${areaProtegida.lat}">
  </div>
  <div class="form-group col-sm-4">
    <label for="lng">Longitud <i class="fas fa-asterisk fa-xs text-muted"></i></label>
     <input type="number" name="lng" class="form-control ${hasErrors(field:'lng','is-invalid')}" value="${areaProtegida.lng}">
  </div>
  <div class="form-group col-sm-4">
    <label for="superficie">Superficie <i class="fas fa-asterisk fa-xs text-muted"></i></label>
    <input type="number" class="form-control ${hasErrors(field:'superficie','is-invalid')}" name="superficie" value="${areaProtegida.superficie}">
  </div>
</div>
<div class="form-group">
    <label for="objetivo">Objetivo</label>
    <textarea class="form-control" name="objetivo" rows="3">${areaProtegida.objetivo}</textarea>
</div>
<div class="form-row">
  <div class="form-group col-sm-6">
      <label for="logo">Logo</label>
      <input type="text" class="form-control" name="logo.url" value="${areaProtegida.logo?.url}">
  </div>
  <div class="form-group col-sm-6">
    <label for="imagen_principal">Imagen principal</label>
    <input type="text" class="form-control" name="imagen_principal.url" value="${areaProtegida.imagen_principal?.url}">
  </div>
</div>
<div class="form-group text-center pt-2">
  <button name="create" type="submit" class="btn btn-success mr-2">Guardar</button>
  <button type="button" class="btn btn-danger ml-2">Volver</button>
</div>