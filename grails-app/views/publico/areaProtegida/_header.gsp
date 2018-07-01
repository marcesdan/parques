<div class="row">
  <div class="col-md-10">
    <h1 class="text-dark mb-4">${areaProtegida.parque}</h1>
    <span class="h6">
      <p><span class="text-dark font-weight-bold">Provincia:</span> ${areaProtegida.provincia}</p>
      <g:if test="${areaProtegida.localidad}">
        <p><span class="text-dark font-weight-bold">Localidad:</span> ${areaProtegida.localidad}</p>
      </g:if>
      <g:if test="${areaProtegida.ano_creacion}">
        <p><span class="text-dark font-weight-bold">Año de creación:</span> ${areaProtegida.ano_creacion}</p>
      </g:if>
      <g:if test="${areaProtegida.objetivo}">
        <p class="text-justify"><span class="text-dark font-weight-bold">Objetivo:</span> ${areaProtegida.objetivo}</p>
      </g:if>
    </span>
  </div>
  <div class="col-md-2 d-none d-md-block">
    <img class="rounded-circle mt-4" src="${areaProtegida.logo?.url}" width="140" height="140">
  </div>
</div>