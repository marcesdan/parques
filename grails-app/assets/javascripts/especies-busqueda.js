$(document).ready(function() {

    $('.js-states').on('select2:select', function () {
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
            cargarVistas(data); 
          }
      });
    }

    function cargarVistas(especies) {
      datatable.clear();
      $('.especie-imagen-card').remove();
      $('.especie-audio-card').remove();
      for (var i = 0; i < especies.length; i++) {
        datatable.row.add(especies[i]);
        if (especies[i].imagen_principal != null) {
          cargarTarjetaImagen(especies[i]);
        }
        if (especies[i].sonidos.length > 0) {
          cargarTarjetaSonido(especies[i]);
        }
      }
      datatable.draw();
      // ajusta los tamaños de las columnas de acuerdo a los nuevos datos
      datatable.columns.adjust().responsive.recalc();
    }

    function cargarTarjetaImagen(especie) {
      var newCard = $('#card-imagen-prototype > div').clone();
      newCard.find('.card-img-top').attr('src', especie.imagen_principal);
      newCard.find('.card-title').text(especie.nombre_cientifico);
      newCard.addClass('especie-imagen-card');
      newCard.removeAttr('hidden');
      newCard.appendTo('#card-imagen-deck');
    }

    function cargarTarjetaSonido(especie) {
      var newCard = $('#card-audio-prototype > div').clone();
      newCard.find('.card-img-top').attr('src', especie.imagen_principal);
      newCard.find('source').attr('src', especie.sonidos[0].url);
      newCard.find('.card-title').text(especie.nombre_cientifico);
      newCard.addClass('especie-audio-card');
      newCard.removeAttr('hidden');
      newCard.appendTo('#card-audio-deck');
    }

    function initDatatable() {
      var datatable = $('#table').DataTable( {
        columns: [
            { "data": "nombre_cientifico", "width": "25%" },
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
              "buttons": {
                copy: 'Copiar',
                colvis: 'Columnas'
              }
          },
          scrollY: "60vh",
          scrollCollapse: true,
          paging: false,
          "lengthChange": false,
          "info": true,
          buttons: [ 'copy', 'excel', 'pdf', 'colvis' ]
    } );

      datatable.buttons().container()
      .appendTo( '#table_wrapper .col-md-6:eq(0)' );

      return datatable;
    }

    $('#table').on( 'column-visibility.dt', function ( e, settings, column, state ) {
        /* arregla un pequeño bug que ocurre entre colvis y fixedheader (se elimina una columna
        y los tamaños de los encabezados no corresponden con los de las filas) */
        $('#table').DataTable().columns.adjust().responsive.recalc();
    } );
});
