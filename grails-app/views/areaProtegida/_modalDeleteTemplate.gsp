<!-- Modal form to delete a form -->
<div id="deleteModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Atención</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h5 class="text-center">Seguro desea eliminar esta área protegida?</h5>
                <input type="text" class="form-control" id="fid_delete" hidden>
                <input type="text" class="form-control" id="area_delete" hidden>
                <div class="text-center text-capitalize text-danger h4 pt-3">
                    <p id="parque"></p>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger delete" data-dismiss="modal">Eliminar</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>