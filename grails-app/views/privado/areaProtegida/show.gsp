<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="public"/>
        <title></title>
    </head>
    <body>
      <h1 class="h4 font-weight-normal text-center text-dark pb-2">Detalles del ${areaProtegida.parque}</h1>
      <nav class="mt-3 text-success">
        <div class="nav nav-tabs nav-fill nav-pills" id="nav-tab" role="tablist">
          <a class="nav-item nav-link active" id="nav-informacion-tab" data-toggle="tab" href="#nav-informacion" role="tab" aria-controls="nav-informacion" aria-selected="true"> 
            <i class="fas fa-info-circle"></i> Información general
          </a>
          <a class="nav-item nav-link" id="nav-especies-tab" data-toggle="tab" href="#nav-especies" role="tab" aria-controls="nav-especies" aria-selected="false"> 
            <i class="fas fa-paw"></i> Especies
          </a>
        </div>
      </nav>
      <div class="tab-content" id="nav-tabContent">
        <div class="tab-pane fade show active" id="nav-informacion" role="tabpanel" aria-labelledby="nav-informacion-tab">
              <g:render template="informacion"/>
        </div>
        <div class="tab-pane fade" id="nav-especies" role="tabpanel" aria-labelledby="nav-especies-tab">
          <g:render template="/publico/areaProtegida/especiesFiltros"/>
          <br>
          <g:render template="/publico/areaProtegida/especiesTabla"/>
        </div>
      </div>
      <g:render template="modalAgregarEspecie"/>
      <content tag="scripts">
        <asset:javascript src="init-selects2.js"/>
        <asset:javascript src="especies-busqueda-privado.js"/>
        <asset:javascript src="agregar-especies.js"/>
        <asset:javascript src="ajax-delete-ap.js"/>
      </content>
    </body>
</html>
