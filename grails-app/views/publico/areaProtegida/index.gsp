<!DOCTYPE html>
<html>
  <head>
      <meta name="layout" content="public" />
  </head>
  <body>
    <h1 class="text-dark">Áreas protegidas</h1>
    <div class="card card-body text-body shadow">
        <p>En esta página presentamos breves cuadros de ingreso a las fichas completas de las áreas protegidas nacionales.</p>
        <p>Los datos aquí presentados, representan indicadores del grado de conocimiento digitalizado (ingresado a nuestra base de datos) con el que actualmente contamos.</p>
        <p>Cabe destacar que estos indicadores son dinámicos y se incrementarán a medida que recibamos e ingresemos nuevas fuentes de información.</p>
    </div>
    <nav class="mt-4">
      <div class="nav nav-tabs" id="nav-tab" role="tablist">
        <a class="nav-item nav-link active" id="nav-tabla-tab" data-toggle="tab" href="#nav-tabla" role="tab" aria-controls="nav-tabla" aria-selected="true">
          <i class="fas fa-table"></i> Tabla
        </a>
        <a class="nav-item nav-link" id="nav-grilla-tab" data-toggle="tab" href="#nav-grilla" role="tab" aria-controls="nav-grilla" aria-selected="false">
          <i class="fas fa-th"></i> Grilla
        </a>
        <a class="nav-item nav-link" id="nav-mapa-tab" data-toggle="tab" href="#nav-mapa" role="tab" aria-controls="nav-mapa" aria-selected="false">
          <i class="fas fa-map-marker-alt"></i> Mapa
        </a>
      </div>
    </nav>
    <div class="tab-content" id="nav-tabContent">
      <div class="tab-pane fade show active" id="nav-tabla" role="tabpanel" aria-labelledby="nav-tabla-tab">
        <g:render template="tablaTemplate"/>
      </div>
      <div class="tab-pane fade mt-3" id="nav-grilla" role="tabpanel" aria-labelledby="nav-grilla-tab">
        <g:render template="grillaTemplate"/>
      </div>
      <div class="tab-pane fade" id="nav-mapa" role="tabpanel" aria-labelledby="nav-mapa-tab">...</div>
    </div>
    <hr>
    <p class="p-2">
      47 Areas Protegidas - Superficie total 4.594.003 ha
      Los datos publicados son provisorios y están en proceso de actualización. Cualquier observación o duda remitirla a la casilla de e-mail: 
      <a href="mailto:sib@apn.gov.ar">sib@apn.gov.ar</a>
    </p>

    <content tag="scripts">
      <asset:javascript src="datatable.js"/>
    </content>
  </body>
</html>
