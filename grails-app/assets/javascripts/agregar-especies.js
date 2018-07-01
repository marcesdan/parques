$(function() {
  // valores comunes a los selects2
  var common_ajax = { 
    width: '100%', allowClear: true, minimumInputLength: 1,
    placeholder: { id: '-1', text: 'Nombre cientifico'},
    ajax: {
      url: '/api/especiesPorNombreCientifico',
      contentType:"application/json; charset=utf-8",
      dataType: 'json',
      delay: 500,
      data: function (params) {
        return {
          str: params.term, // search term
        };
      },
    },
  };

  $('.select-nombre-cientifico').select2(common_ajax);

  $('.modal-footer').on('click', '#agregar', function() {
      var especiesArray = JSON.stringify( $(".select-nombre-cientifico").select2('val') )
      console.log(especiesArray)
      $.ajax({
          type: 'POST',
          url: '/admin/areas-protegidas/agregarEspecies/' + $('#fid_agregar').val(),
          dataType: 'json',
          data: {especies: especiesArray},
          success: function(data) {
              console.log(data)
              toastr.success('Se han agregado especies con éxito!', 'Notificación:', {"timeOut": 5000, "positionClass": "toast-top-center"});
              recargarTabla(data);
          }
      });
  });

  function recargarTabla(data) {
      var datatable = $('#table').DataTable();
      datatable.rows.add(data);
      datatable.draw();
      // ajusta los tamaños de las columnas de acuerdo a los nuevos datos
      datatable.columns.adjust().responsive.recalc();
    }  
});
