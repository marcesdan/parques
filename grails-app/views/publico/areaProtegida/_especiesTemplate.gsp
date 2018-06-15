<div class="card mt-4 shadow">
	<h6 class="card-header"><i class="fas fa-search"></i> Filtros de búsqueda</h6>
	<div class="card-body">
    <form>
      <div class="form-row pl-3 pr-3">
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="form-control form-control-sm text-dark" name="reino">
            <option value="-1">Reino (ver todo)</option>
            <option value="ANIMALIA">ANIMALIA</option>
            <option value="BACTERIA">BACTERIA</option>
            <option value="FUNGI">FUNGI</option>
            <option value="PLANTAE">PLANTAE</option>
          </select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="select-clase js-states form-control" name="clase">
          </select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="select-orden js-states form-control" name="orden">
          </select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="select-familia js-states form-control" name="familia">
          </select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="form-control form-control-sm text-dark" name="origen">
            <option value="-1">Origen (ver todo)</option>
            <option value="Autóctono">Autóctono</option>
            <option value="Endémico">Endémico</option>
            <option value="Introducido">Introducido</option>
            <option value="Naturalizado">Naturalizado</option>
            <option value="Sin datos">Sin datos</option>
          </select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="form-control form-control-sm text-dark" name="tiene-fotos">
            <option value="-1">Tiene fotos? (ver todo)</option>
            <option value="0">No</option>
            <option value="1">Si</option>
          </select>
        </div>
        <div class="col-lg-6 col-md-12 col-sm-12 pb-2 pt-2">
            <input type="text" class="form-control form-control-custom" id="inlineFormInputGroup" placeholder="Especie, genero, nombre científico o nombre común">
        </div>
      </div>
    </form>
	</div>
</div>
<nav class="mt-4">
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <a class="nav-item nav-link active" id="nav-tabla-tab" data-toggle="tab" href="#nav-tabla" role="tab" aria-controls="nav-tabla" aria-selected="true">
      <i class="fas fa-table"></i> Tabla
    </a>
    <a class="nav-item nav-link" id="nav-grilla-tab" data-toggle="tab" href="#nav-grilla" role="tab" aria-controls="nav-grilla" aria-selected="false">
      <i class="fas fa-th"></i> Grilla
    </a>
  </div>
</nav>
<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-tabla" role="tabpanel" aria-labelledby="nav-tabla-tab">
    <g:render template="tablaEspeciesTemplate"/>
  </div>
  <div class="tab-pane fade mt-3" id="nav-grilla" role="tabpanel" aria-labelledby="nav-grilla-tab">
    <g:render template="grillaEspeciesTemplate"/>
  </div>
</div>
<hr>
<p class="p-2">
  47 Areas Protegidas - Superficie total 4.594.003 ha
  Los datos publicados son provisorios y están en proceso de actualización. Cualquier observación o duda remitirla a la casilla de e-mail: 
  <a href="mailto:sib@apn.gov.ar">sib@apn.gov.ar</a>
</p>