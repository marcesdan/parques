$(document).ready(function() {

    var common_ajax = { 
      width: '100%', allowClear: true, minimumInputLength: 1,
      placeholder: { id: '-1', text: 'Clase'},
      ajax: {
        url: '/api/clases',
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

    $('.select-clase').select2(common_ajax);

    common_ajax.placeholder.text = 'Familia';
    common_ajax.ajax.url = '/api/familias';
    $('.select-familia').select2(common_ajax);

    common_ajax.placeholder.text = 'Orden';
    common_ajax.ajax.url = '/api/ordenes';
    $('.select-orden').select2(common_ajax);

    var common = { 
      width: '100%', allowClear: true, 
      placeholder: { id: '-1', text: 'Tiene fotos?'} 
    };

    $('.select-tiene-fotos').select2(common);

    common.placeholder.text = 'Origen';
    $('.select-origen').select2(common);

    common.placeholder.text = 'Reino';
    $('.select-reino').select2(common);   
});  