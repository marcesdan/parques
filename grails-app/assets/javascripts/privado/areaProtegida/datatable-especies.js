var datatable = $('#table').DataTable( {
        columns: [
            { "data": "nombre_cientifico" },
            { "data": "reino" },
            { "data": "clase" },
            { "data": "orden" },
            { "data": "familia" },
            { "data": "genero" },
            { "data": "nombre" },
            { "data": "nombre_comun" },
            { "data": "origen" }
        ],
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
          },
          scrollY: "60vh",
          scrollCollapse: true,
          paging: false,
          "fixedColumns": true,
          "lengthChange": false,
          "info": true,
} );