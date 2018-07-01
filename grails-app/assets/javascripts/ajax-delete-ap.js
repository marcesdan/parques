// delete a post
$(document).on('click', '.delete-modal', function() {
    var stuff = $(this).data('info').split(',');
    $('#fid_delete').val(stuff[0]);
    $('#area_delete').val(stuff[1]);
    $('#parque').text(stuff[1]);
    $('#deleteModal').modal('show');
});

$('.modal-footer').on('click', '.delete', function() {
    $.ajax({
        type: 'DELETE',
        url: '/admin/areas-protegidas/eliminar/' + $('#fid_delete').val(),
        success: function(data) {
            toastr.success('Área protegida eliminada con éxito', 'Notificación:', {"timeOut": 5000, "positionClass": "toast-top-center"});
            $('.item' + $('#fid_delete').val()).remove();
        }
    });
});
