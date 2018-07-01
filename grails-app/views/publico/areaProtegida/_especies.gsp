<g:render template="especiesFiltros"/>
<nav class="mt-4">
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <a class="nav-item nav-link active" id="nav-tabla-tab" data-toggle="tab" href="#nav-tabla" role="tab" aria-controls="nav-tabla" aria-selected="true">
      <i class="fas fa-table"></i> Tabla
    </a>
    <a class="nav-item nav-link" id="nav-fotos-tab" data-toggle="tab" href="#nav-fotos" role="tab" aria-controls="nav-fotos" aria-selected="false">
      <i class="far fa-image"></i> Grilla con fotos
    </a>
    <a class="nav-item nav-link" id="nav-audios-tab" data-toggle="tab" href="#nav-audios" role="tab" aria-controls="nav-audios" aria-selected="false">
      <i class="fas fa-volume-up"></i> Grilla con audios
    </a>
  </div>
</nav>
<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-tabla" role="tabpanel" aria-labelledby="nav-tabla-tab">
    <g:render template="especiesTabla"/>
  </div>
  <div class="tab-pane fade mt-3" id="nav-fotos" role="tabpanel" aria-labelledby="nav-fotos-tab">
    <g:render template="especiesFotos"/>
  </div>
  <div class="tab-pane fade mt-3" id="nav-audios" role="tabpanel" aria-labelledby="nav-audis-tab">
    <g:render template="especiesAudios"/>
  </div>
</div>
<hr>