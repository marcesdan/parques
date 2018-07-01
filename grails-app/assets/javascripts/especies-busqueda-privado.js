$(document).ready(function() {

    $('.filtro').on('select2:select', function () {
      getEspecies();
    });
    $('.static-states').on('change', function () {
      getEspecies();
    });

    var datatable = initDatatable();
    var especies = [];

    function getEspecies() {
      var URL = '/areas-protegidas/' + $('#slug').val() + '/especies';
      $.ajax({
          type: 'POST',
          url: URL,
          data: {
            reino: $(".select-reino option:selected").val(),
            clase: $(".select-clase option:selected").text(),
            orden: $(".select-orden option:selected").text(),
            familia: $(".select-familia option:selected").text(),
            genero: $(".select-genero option:selected").text(),
            origen: $(".select-origen option:selected").val(),
            tieneFotos: $(".select-fotos option:selected").val()
          },
          success: function(data) {
            especies = data
            recargarTabla(data);
          }
      });
    }

    function recargarTabla(data) {
      datatable.clear();
      datatable.rows.add(data);
      datatable.draw();
      // ajusta los tamaños de las columnas de acuerdo a los nuevos datos
      datatable.columns.adjust().responsive.recalc();
    }

    function initDatatable() {
      $.fn.dataTable.ext.buttons.agregar = {
        text: 'Agregar existente',
        action: function ( e, dt, node, config ) {
            $('#agregarModal').modal('show');
        }
      };
      $.fn.dataTable.ext.buttons.nueva = {
        text: 'Crear nueva',
        action: function ( e, dt, node, config ) {
            window.location.href = '/admin/especies/nueva';
        }
      };
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
          "lengthChange": false,
          "info": true,
          buttons: [ 'agregar', 'nueva' ]
    } );

      datatable.buttons().container()
      .appendTo( '#table_wrapper .col-md-6:eq(0)' );

      return datatable;
    }
});


