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
                        <a href="/grilla">
                          <li class="text-success"><i class="fas fa-th"></i><strong> Ver grilla</strong></li>
                        </a>
                        <a href="#">
                          <li class="text-success"><i class="fas fa-map-marker-alt"></i><strong> Ver mapa</strong></li>
                        </a>
                </ul>
            </div>
            <table id="table" class="table table-striped table-bordered compact table-sm dt-responsive nowrap" style="width:100%">
            <thead>
                <tr>
                    <th class="text-center">Área protegida</th>
                    <th class="text-center">Region</th>
                    <th class="text-center">Provincia</th>
                    <th class="text-center">Localidad</th>
                </tr>
            </thead>
            <g:each in="${areaProtegidaList}" var="areaProtegida">
                <tr class="areaProtegida{$areaProtegida.id}">
                      <td><a href="#" class="text-success"><strong>${areaProtegida.parque}</strong</a></td>
                      <td>${areaProtegida.delegacion}</td>
                      <td>${areaProtegida.localidad}</td>
                      <td>${areaProtegida.provincia}</td>
                </tr>
            </g:each>
            </table>
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
