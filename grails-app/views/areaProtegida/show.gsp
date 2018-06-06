<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'areaProtegida.label', default: 'AreaProtegida')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
      <div class="container">
        <div class="row">
          <div class="col-xs-12 col-sm-10">
            <h1>${areaProtegida.parque}</h1>
            <p>Provincia: ${areaProtegida.provincia} - Localidad: ${areaProtegida.localidad}</p>
            <p>Objetivo: ${areaProtegida.objetivo}</p>
          </div>
          <div class="col-sm-2 d-none d-sm-block">
            <img class="rounded-circle" src="https:${areaProtegida.logo?.thumb_200px}" width="140" height="140">
          </div>
        </div>
        <nav>
          <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Información general</a>
            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Especies</a>
          </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">
          <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">...</div>
          <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">...</div>
          <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div>
        </div>
      </div>
    </body>
</html>
