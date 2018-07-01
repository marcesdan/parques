<!-- Modal form to delete a form -->
<div id="agregarModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Agregar especie al área protegida</h4>
                <input type="text" id="fid_agregar" value="${areaProtegida.id}" hidden>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <h6>Ingrese el nombre científico de la especie a agregar al ${areaProtegida.parque}</h6>
                <select class="select-nombre-cientifico js-states  form-control" name="nombre_cientifico[]" multiple="multiple"></select>
            </div>
            <div class="modal-footer">
                <button type="button" id="agregar" class="btn btn-success" data-dismiss="modal">Agregar</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>