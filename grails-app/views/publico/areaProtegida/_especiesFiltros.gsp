<div class="card mt-4 shadow">
	<h6 class="card-header"><i class="fas fa-search"></i> Filtros de búsqueda</h6>
	<div class="card-body">
    <form id="search-form">
      <input id="slug" value="${areaProtegida.slug}" hidden>
      <div class="form-row pl-3 pr-3">
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="select-reino static-states form-control form-control-sm text-dark" name="reino">
            <option value="">Reino (ver todo)</option>
            <option value="ANIMALIA">ANIMALIA</option>
            <option value="BACTERIA">BACTERIA</option>
            <option value="FUNGI">FUNGI</option>
            <option value="PLANTAE">PLANTAE</option>
          </select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="select-clase js-states filtro form-control" name="clase"></select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="select-orden js-states filtro form-control" name="orden"></select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="select-familia js-states filtro form-control" name="familia"></select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="select-genero js-states filtro form-control" name="genero"></select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 pb-2 pt-2">
          <select class="select-origen static-states form-control form-control-sm text-dark" name="origen">
            <option value="">Origen (ver todo)</option>
            <option value="Autóctono">Autóctono</option>
            <option value="Endémico">Endémico</option>
            <option value="Introducido">Introducido</option>
            <option value="Naturalizado">Naturalizado</option>
            <option value="Sin datos">Sin datos</option>
          </select>
        </div>
        <div class="col-lg-6 col-md-12 col-sm-12 pb-3 pt-2">
            <input type="text" class="form-control form-control-custom" 
            placeholder="Especie o nombre común (proximamente)" disabled>
        </div>  
      </div> %{-- form-row --}%
    </form>
	</div> %{-- card- body--}%
</div> %{-- card --}%