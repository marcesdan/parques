$(document).ready(function() {

    // valores comunes a los selects2
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

    // se cambian los únicos valores que difieren
    common_ajax.placeholder.text = 'Familia';
    common_ajax.ajax.url = '/api/familias';
    $('.select-familia').select2(common_ajax);

    common_ajax.placeholder.text = 'Orden';
    common_ajax.ajax.url = '/api/ordenes';
    $('.select-orden').select2(common_ajax);
});  