<!DOCTYPE html>
<html>
  <head>
      <meta name="layout" content="public" />
  </head>
  <body>
    
    <h1 class="text-dark">Áreas protegidas</h1>
    <div class="card card-body text-body shadow">
        <p>
          En esta página presentamos breves cuadros de ingreso a las fichas completas de las áreas protegidas nacionales. 
        </p>
        <p>
          Los datos aquí presentados, representan indicadores del grado de conocimiento digitalizado (ingresado a nuestra base de datos) con el que actualmente contamos.
        </p>
        <p>
          Cabe destacar que estos indicadores son dinámicos y se incrementarán a medida que recibamos e ingresemos nuevas fuentes de información.
        </p>
    </div>

    <ul class="nav nav-tabs mt-4" id="myTab" role="tablist">
      <li class="nav-item">
        <a class="nav-link active text-success" id="tabla-tab" data-toggle="tab" href="#tabla" role="tab" aria-controls="tabla" aria-selected="true">
          <i class="fas fa-table"></i><strong> Tabla</strong>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-success" id="grilla-tab" data-toggle="tab" href="#grilla" role="tab" aria-controls="grilla" aria-selected="false">
          <i class="fas fa-th"></i><strong> Grilla</strong></a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-success" id="mapa-tab" data-toggle="tab" href="#mapa" role="tab" aria-controls="mapa" aria-selected="false">
          <i class="fas fa-map-marker-alt"></i><strong> Mapa</strong></a>
      </li>
    </ul>
    <div class="tab-content" id="myTabContent">
      <div class="tab-pane fade show active" id="tabla" role="tabpanel" aria-labelledby="tabla-tab">
        <div class="table-responsive-sm">
          <table id="table" class="table table-striped table-bordered compact table-sm dt-responsive nowrap shadow" style="width:100%">
            <thead>
              <tr class="text-dark">
                <th class="text-center">Área protegida</th>
                <th class="text-center">Region</th>
                <th class="text-center">Provincia</th>
                <th class="text-center">Localidad</th>
              </tr>
            </thead>
            <g:each in="${areaProtegidaList}" var="areaProtegida">
              <tr class="areaProtegida{$areaProtegida.id} text-dark">
                <td>
                  <a href="/areaProtegida/show/${areaProtegida.id}" class="text-success">
                    <strong>${areaProtegida.parque}</strong>
                  </a>
                </td>
                <td>${areaProtegida.delegacion}</td>
                <td>${areaProtegida.localidad}</td>
                <td>${areaProtegida.provincia}</td>
              </tr>
            </g:each>
          </table>
       </div> 
      </div> <!-- /.tab-pane -->
      
      <div class="tab-pane fade mt-4" id="grilla" role="tabpanel" aria-labelledby="grilla-tab">
        <div class="album">
          <div class="card-deck">
            <g:each in="${areaProtegidaList}" var="areaProtegida">
              <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-xs-12 mb-4 box-shadow">
                <div class="card profile-view shadow">
                    <img class="card-img-top" src="https:${areaProtegida.imagen_principal?.url}" alt="Card image cap" width="272" height="180">
                    <img class="rounded-circle pv-main shadow-sm" src="https:${areaProtegida.logo?.url}" width="140" height="140">
                      <div class="card-body text-center mt-4">
                        <h5 class="card-title text-dark mt-4 ">${areaProtegida.parque}</h5>
                        <p class="card-text"><i class="fas fa-map-marker-alt"></i> ${areaProtegida.localidad}, ${areaProtegida.provincia}</p>
                      </div>
                  <div class="card-footer text-center">
                    <a class="btn btn-secondary btn-sm btn-block btn-success" href="/areaProtegida/show/${areaProtegida.id}" role="button">Ver ficha &raquo;</a>
                  </div>
                </div><!-- /.card -->
              </div><!-- /.col-x-x -->
            </g:each>
          </div><!-- /.card-deck -->
        </div><!-- /.album -->
      </div><!-- /.tab-pane -->

      <div class="tab-pane fade" id="mapa" role="tabpanel" aria-labelledby="mapa-tab">
      </div><!-- /.tab-pane -->

    </div><!-- /.tab-content -->
    <hr>
    <p class="p-2">
      47 Areas Protegidas - Superficie total 4.594.003 ha
      Los datos publicados son provisorios y están en proceso de actualización. Cualquier observación o duda remitirla a la casilla de e-mail: 
      <a href="mailto:sib@apn.gov.ar">sib@apn.gov.ar</a>
    </p>  

    <script type="text/javascript">
      var table = $('#table').DataTable( {
        "order": [[1, 'asc']],
          "language": {
              "sProcessing":     "Procesando...",
              "sLengthMenu":     "Mostrar _MENU_ registros",
              "sZeroRecords":    "No se encontraron resultados",
              "sEmptyTable":     "Ningún dato disponible en esta tabla",
              "sInfo":           "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
              "sInfoEmpty":      "Mostrando registros del 0 al 0 de un total de 0 registros",
              "sInfoFiltered":   "(filtrado de un total de _MAX_ registros)",
              "sInfoPostFix":    "",
              "sSearch":         "Buscar:",
              "sUrl":            "",
              "sInfoThousands":  ",",
              "sLoadingRecords": "Cargando...",
              "oPaginate": {
                  "sFirst":    "Primero",
                  "sLast":     "Último",
                  "sNext":     "Siguiente",
                  "sPrevious": "Anterior"
              },
              "oAria": {
                  "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
                  "sSortDescending": ": Activar para ordenar la columna de manera descendente"
              },
              "buttons": {
                copy: 'Copiar',
                colvis: 'Columnas'
              }
          },
          "lengthChange": false,
          "info": false,
          buttons: [ 'copy', 'excel', 'pdf', 'colvis' ]
      } );

      table.buttons().container()
          .appendTo( '#table_wrapper .col-md-6:eq(0)' );
    </script>
  </body>
</html>
