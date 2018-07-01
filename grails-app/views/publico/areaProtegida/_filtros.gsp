<div class="card mt-4 shadow">
	<h6 class="card-header"><i class="fas fa-search"></i> Filtros de búsqueda</h6>
	<div class="card-body">
    <form id="search-form">
      <div class="form-row pl-3 pr-3">
        <div class="col-sm-6">
          <label class="font-weight-bold" for="delegacion">Región:</label>
          <select class="form-control form-control-sm filtro" id="region" name="delegacion">
            <option value="">Region (mostrar todo)</option>
            <option value="CENTRO">CENTRO</option>
            <option value="CENTRO ESTE">CENTRO ESTE</option>
            <option value="NEA">NEA</option>
            <option value="NOA">NOA</option>
            <option value="PATA NORTE">PATA NORTE</option>
            <option value="PATA SUR">PATA SUR</option>
          </select>
        </div>
      </div> %{-- form-row --}%
    </form>
	</div> %{-- card- body--}%
  <div id="info" class="card-footer bg-white">
  </div>
</div> %{-- card --}%