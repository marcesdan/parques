<div class="album">
  <div class="card-deck">
    <g:each in="${areaProtegidaList}" var="areaProtegida">
      <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-xs-12 mb-4 box-shadow">
        <div class="card profile-view shadow">
            <img class="card-img-top" src="https:${areaProtegida.imagen_principal?.url}" alt="Card image cap" width="272" height="180">
            <img class="rounded-circle pv-main shadow-sm" src="https:${areaProtegida.logo?.url}" width="140" height="140">
              <div class="card-body text-center mt-4">
                <h5 class="card-title text-dark font-weight-bold mt-4 ">${areaProtegida.parque}</h5>
                <p class="card-text"><i class="fas fa-map-marker-alt"></i> ${areaProtegida.localidad}, ${areaProtegida.provincia}</p>
              </div>
          <div class="card-footer text-center">
            <a class="btn btn-secondary btn-sm btn-block btn-success" href="/area-protegida/${areaProtegida.id}" role="button">Ver ficha &raquo;</a>
          </div>
        </div><!-- /.card -->
      </div><!-- /.col-x-x -->
    </g:each>
  </div><!-- /.card-deck -->
</div><!-- /.album -->