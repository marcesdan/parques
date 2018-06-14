<div class="card mt-4">
	<h6 class="card-header">Filtros de búsqueda</h6>
	<div class="card-body">
    <form>
      <div class="form-row pl-3 pr-3 ">
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="select-reino js-states form-control" name="reino" style="width: 100%">
          </select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="select-clase js-states form-control" name="clase" style="width: 100%">
          </select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="select-orden js-states form-control" name="orden" style="width: 100%">
          </select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="select-familia js-states form-control" name="familia" style="width: 100%">
          </select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="select-origen js-states form-control" name="origen" style="width: 100%">
          </select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="select-tiene-fotos js-states form-control" name="tiene-fotos" style="width: 100%">
          </select>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-12 pb-2 pt-2">
            <input type="text" class="form-control form-control-sm" id="inlineFormInputGroup" placeholder="Username">
          </div>
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

<script type="text/javascript">
  $(document).ready(function() {
      $('.select-reino').select2({
        width: 'resolve', // need to override the changed default
        allowClear: true,
        placeholder: {
            id: '-1', // the value of the option
            text: 'Reino'
          }
      });

      $('.select-clase').select2({
        width: 'resolve', // need to override the changed default
        allowClear: true,
        placeholder: {
            id: '-1', // the value of the option
            text: 'Clase'
          }
      });

      $('.select-orden').select2({
        width: 'resolve', // need to override the changed default
        allowClear: true,
        placeholder: {
            id: '-1', // the value of the option
            text: 'Orden'
          }
      });

      $('.select-familia').select2({
        width: 'resolve', // need to override the changed default
        allowClear: true,
        placeholder: {
            id: '-1', // the value of the option
            text: 'Familia'
          }
      });

      $('.select-tiene-fotos').select2({
        width: 'resolve', // need to override the changed default
        allowClear: true,
        placeholder: {
            id: '-1', // the value of the option
            text: 'Tiene fotos?'
          }
      });

      $('.select-origen').select2({
        width: 'resolve', // need to override the changed default
        allowClear: true,
        placeholder: {
            id: '-1', // the value of the option
            text: 'Origen'
          }
      });
  });  
</script>
