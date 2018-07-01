<div class="row mt-4 mb-4">
  %{-- lado izquierdo --}%
  <div class="col-lg-6">
    <div class="row pr-2">
      <div class="col-md-6">
        <div class="card text-white bg-secondary mb-3 shadow">
          <div class="card-body">
            <h6 class="card-title font-weight-bold">Superficie:</h6>
            <span class="h4">${areaProtegida.superficie} ha</span>
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="card text-white bg-success mb-3 shadow">
          <div class="card-body">
            <h6 class="card-title font-weight-bold">Especies registradas:</h6>
            <span class="h4">${areaProtegida.especies.size()}</span>
          </div>
        </div>
      </div>
      <g:if test="${areaProtegida.objetivos}">
        <div class="col-md-12">
          <div class="card mb-3 shadow">
            <div class="card-header h6 font-weight-bold">Objetivos:</div>
            <div class="card-body">
              <ul>
                <g:each in="${areaProtegida.objetivos}" var="objetivo">
                <li><p>${objetivo.descripcion}</p></li>
                </g:each>
              </ul>
            </div> %{-- card-body --}%
          </div> %{-- card --}%
        </div> %{-- col --}%
      </g:if>  
    </div> %{-- row --}%
  </div> %{-- col --}%

  %{-- lado derecho --}%
  <div class="col-lg-6">
    <div class="row pl-2">
      <div id="map" class="shadow-lg"></div>
      <div class="shadow-lg mt-4">
        <img class="img-fluid shadow-lg" src="${areaProtegida.imagen_principal.url}">
      </div>    
    </div>
  </div>
</div> %{-- row --}%
