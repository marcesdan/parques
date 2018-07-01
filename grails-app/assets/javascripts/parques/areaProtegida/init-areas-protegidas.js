var map;
function iniciarMapa() {
    map = new GMaps({ 
      div: '#map-areas-protegidas',
      lat: -40.9541,  
      lng: -67.5364,
      mapType: 'satellite',
      width: '100%',
      height: '700px',
      zoom: 4.2,
  });
}

$(function() {

  var datatable = initDatatable();
  buscarAreasProtegidas();

  $('.filtro').on('change', function() {
    buscarAreasProtegidas();
  });

  function buscarAreasProtegidas() {
      var region = $('#region').val();
      $.ajax({
        url: '/',
        type: 'get',
        contentType: 'application/json',
        dataType: 'json',
        data: {region: region},
      })
      .done(function(data) {
        cargarVistas(data);
      });
  }

  function cargarVistas(data) {
      // Se elimina todo
      datatable.clear();
      $('.area-protegida-card').remove();
      map.removeMarkers()
      // Y se vuelve a cargar
      var superficie = 0;
      for (var i = 0; i < data.length; i++) {
          cargarFila(data[i]);
          cargarTarjeta(data[i]);
          cargarMarker(data[i]);
          superficie += data[i].superficie;
      }
      datatable.draw();
      // ajusta los tamaños de las columnas de acuerdo a los nuevos datos
      datatable.columns.adjust().responsive.recalc();
      map.refresh();
      $('#info').text(data.length + ' Areas Protegidas - Superficie total ' + parseInt(superficie) + ' ha.');
  }

  function cargarFila(area) {
      var url = '/areas-protegidas/' + area.slug;
      var newRow = datatable.row.add(area).node();
      // El buen JQuery <3
      $('td:first-child', newRow)
        .wrap('<a href=' + url + '></a>')
        .addClass('text-success font-weight-bold');
  }

  function cargarTarjeta(area) {
      var newCard = $('#card-prototype > div').clone();
      newCard.find('.card-img-top').attr('src', area.imagen_principal);
      newCard.find('.rounded-circle').attr('src', area.logo);
      newCard.find('h5').text(area.parque);
      var lugar = area.ciudad ? area.ciudad + ", " + area.provincia : area.provincia;
      newCard.find('p').text(lugar);
      var url = '/areas-protegidas/' + area.slug;
      newCard.find('.btn').attr('href', url);
      newCard.addClass('area-protegida-card');
      newCard.removeAttr('hidden');
      newCard.appendTo('.card-deck');
  }

  function cargarMarker(area) {
      map.addMarker({
        lat: area.lat,
        lng: area.lng,
        title: area.parque
      });
  }

  function initDatatable() {
    var table = $('#table').DataTable( {
      columns: [
          { "data": "parque", "width": "25%"},
          { "data": "delegacion" },
          { "data": "provincia" },
          { "data": "localidad" },
          { "data": "ano_creacion" },
          { "data": "superficie" },
          { "data": "lat" },
          { "data": "lng" },
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
        "lengthChange": false,
        "info": false,
        scrollY: "60vh",
        paging: false,
        "lengthChange": false,
        buttons: [ 'copy', 'excel', 'pdf', 'colvis' ]
    } );
    table.buttons().container()
      .appendTo( '#table_wrapper .col-md-6:eq(0)' ); 
    return table;
  }
});
