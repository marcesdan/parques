<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="public" />
        <title>${areaProtegida.parque}</title>
    </head>
    <body>
      <div class="container">
        <g:render template="fichaTemplate"/>
        <nav class="mt-3">
          <div class="nav nav-tabs nav-fill" role="tablist">
            <a class="nav-item nav-link active text-success font-weight-bold h6" href="#" role="tab" aria-controls="nav-informacion" aria-selected="true">
              <i class="fas fa-info-circle"></i> Información general
            </a>
            <a class="nav-item nav-link text-success font-weight-bold h6" role="tab" aria-controls="nav-especies" aria-selected="false" href="/area-protegida/especies/${areaProtegida.id}">
              <i class="fas fa-paw"></i> Especies
            </a>
          </div>
        </nav>
      </div>
    </body>
</html>
