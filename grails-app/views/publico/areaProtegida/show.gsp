<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="public" />
        <title>${areaProtegida.parque}</title>
    </head>
    <body>
      <div class="container">
        <g:render template="fichaTemplate"/>
        <nav class="mt-3 text-success">
          <div class="nav nav-tabs nav-fill nav-pills" id="nav-tab" role="tablist">
            <a class="nav-item nav-link active" id="nav-informacion-tab" data-toggle="tab" href="#nav-informacion" role="tab" aria-controls="nav-informacion" aria-selected="true"> 
              <i class="fas fa-info-circle"></i> Información general
            </a>
            <a class="nav-item nav-link" id="nav-especies-tab" data-toggle="tab" href="#nav-especies" role="tab" aria-controls="nav-especies" aria-selected="false"> 
              <i class="fas fa-paw"></i> Especies
            </a>
          </div>
        </nav>
        <div class="tab-content" id="nav-tabContent">
          <div class="tab-pane fade show active" id="nav-informacion" role="tabpanel" aria-labelledby="nav-informacion-tab">

          </div>
          <div class="tab-pane fade" id="nav-especies" role="tabpanel" aria-labelledby="nav-especies-tab">
            <g:render template="especiesTemplate"/>
          </div>
        </div>
      </div>
    </body>
</html>
