$(document).ready(function() {

    // valores comunes a los selects2
    var common_ajax = { 
      width: '100%', allowClear: true, minimumInputLength: 1,
      placeholder: { id: '-1', text: 'Genero'},
      ajax: {
        url: '/api/generos',
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
    $('.select-genero').select2(common_ajax);
});  