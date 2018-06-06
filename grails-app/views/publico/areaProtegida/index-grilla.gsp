<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="public" />
    </head>
    <body>
      <div class="card card-table">
            <div class="card-header card-header-table flex-row">
                <ul class="nav nav-pills card-header-pills">
                        <li><strong>Áreas protegidas</strong></li>
                        <a href="/">
                          <li class="text-success"><i class="fas fa-table"></i><strong> Ver tabla</strong></li>
                        </a>
                        <a href="#">
                          <li class="text-success"><i class="fas fa-map-marker-alt"></i><strong> Ver mapa</strong></li>
                        </a>
                </ul>
            </div>
          <div class="album py-4 bg-light">
              <div class="card-deck">
                <g:each in="${areaProtegidaList}" var="areaProtegida">
                  <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-xs-12 mb-4 box-shadow">
                    <div class="card profile-view">
                        <img class="card-img-top" src="https:${areaProtegida.imagen_principal?.thumb_200px}" alt="Card image cap" width="272" height="180">
                        <img class="rounded-circle pv-main" src="https:${areaProtegida.logo?.thumb_200px}" width="140" height="140">
                      <div class="card-body text-center mt-4">
                        <h5 class="card-title mt-4">${areaProtegida.parque}</h5>
                        <p class="card-text"><i class="fas fa-map-marker-alt"></i> ${areaProtegida.localidad}, ${areaProtegida.provincia}</p>
                      </div>
                      <div class="card-footer text-center">
                        <a class="btn btn-secondary btn-sm btn-block btn-success" href="/areaProtegida/show/${areaProtegida.id}" role="button">Ver ficha &raquo;</a>
                      </div>
                    </div><!-- /.col-lg-4 -->
                  </div><!-- /.col-lg-4 -->
                </g:each>
              </div><!-- /.col-lg-4 -->
            </div>

    </div>

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
              buttons: [ 'copy', 'excel', 'pdf', 'colvis' ]
          } );

          table.buttons().container()
              .appendTo( '#table_wrapper .col-md-6:eq(0)' );
        </script>

    </body>
</html>
