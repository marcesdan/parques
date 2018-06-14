<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="public" />
        <title>${areaProtegida.parque}</title>

        <style type="text/css">
          /* TABLES */

          table {
              border-top: 1px solid #DFDFDF;
              border-collapse: collapse;
              width: 100%;
              margin-bottom: 1em;
          }

          tr {
              border: 0;
          }

          tr>td:first-child, tr>th:first-child {
              padding-left: 1.25em;
          }

          tr>td:last-child, tr>th:last-child {
              padding-right: 1.25em;
          }

          td, th {
              line-height: 1.5em;
              padding: 0.5em 0.6em;
              text-align: left;
              vertical-align: top;
          }

          th {
              background-color: #efefef;
              background-image: -moz-linear-gradient(top, #ffffff, #eaeaea);
              background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ffffff), color-stop(1, #eaeaea));
              filter: progid:DXImageTransform.Microsoft.gradient(startColorStr = '#ffffff', EndColorStr = '#eaeaea');
              -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorStr='#ffffff', EndColorStr='#eaeaea')";
              color: #666666;
              font-weight: bold;
              line-height: 1.7em;
              padding: 0.2em 0.6em;
          }

          thead th {
              white-space: nowrap;
          }

          th a {
              display: block;
              text-decoration: none;
          }

          th a:link, th a:visited {
              color: #666666;
          }

          th a:hover, th a:focus {
              color: #333333;
          }

          th.sortable a {
              background-position: right;
              background-repeat: no-repeat;
              padding-right: 1.1em;
          }

          th.asc a {
              background-image: url(../images/skin/sorted_asc.gif);
          }

          th.desc a {
              background-image: url(../images/skin/sorted_desc.gif);
          }

          .odd {
              background: #f7f7f7;
          }

          .even {
              background: #ffffff;
          }

          th:hover, tr:hover {
              background: #f5f5f5;
          }

          /* PAGINATION */

          .pagination {
              border-top: 0;
              margin: 0.8em 1em 0.3em;
              padding: 0.3em 0.2em;
              text-align: center;
              -moz-box-shadow: 0 0 3px 1px #AAAAAA;
              -webkit-box-shadow: 0 0 3px 1px #AAAAAA;
              box-shadow: 0 0 3px 1px #AAAAAA;
              background-color: #EFEFEF;
          }

          .pagination a,
          .pagination .currentStep {
              color: #666666;
              display: inline-block;
              margin: 0 0.1em;
              padding: 0.25em 0.7em;
              text-decoration: none;
              -moz-border-radius: 0.3em;
              -webkit-border-radius: 0.3em;
              border-radius: 0.3em;
          }

          .pagination a:hover, .pagination a:focus,
          .pagination .currentStep {
              background-color: #999999;
              color: #ffffff;
              outline: none;
              text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.8);
          }

          .no-borderradius .pagination a:hover, .no-borderradius .pagination a:focus,
          .no-borderradius .pagination .currentStep {
              background-color: transparent;
              color: #444444;
              text-decoration: underline;

          .buttons {
              background-color: #efefef;
              overflow: hidden;
              padding: 0.3em;
              -moz-box-shadow: 0 0 3px 1px #aaaaaa;
              -webkit-box-shadow: 0 0 3px 1px #aaaaaa;
              box-shadow: 0 0 3px 1px #aaaaaa;
              margin: 0.1em 0 0 0;
              border: none;
          }

          .buttons input,
          .buttons a {
              background-color: transparent;
              border: 0;
              color: #666666;
              cursor: pointer;
              display: inline-block;
              margin: 0 0.25em 0;
              overflow: visible;
              padding: 0.25em 0.7em;
              text-decoration: none;

              -moz-border-radius: 0.3em;
              -webkit-border-radius: 0.3em;
              border-radius: 0.3em;
          }

          .buttons input:hover, .buttons input:focus,
          .buttons a:hover, .buttons a:focus {
              background-color: #999999;
              color: #ffffff;
              outline: none;
              text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.8);
              -moz-box-shadow: none;
              -webkit-box-shadow: none;
              box-shadow: none;
          }

          .no-borderradius .buttons input:hover, .no-borderradius .buttons input:focus,
          .no-borderradius .buttons a:hover, .no-borderradius .buttons a:focus {
              background-color: transparent;
              color: #444444;
              text-decoration: underline;
          }
          }
        </style>
    </head>
    <body>
      <div class="container">
        <g:render template="fichaTemplate"/>
        <nav class="mt-3">
          <div class="nav nav-tabs nav-fill" role="tablist">
            <a class="nav-item nav-link text-success font-weight-bold h6" role="tab" aria-controls="nav-informacion" aria-selected="false" href="/area-protegida/${areaProtegida.id}">
              <i class="fas fa-info-circle"></i> Información general
            </a>
            <a class="nav-item nav-link active text-success font-weight-bold h6" href="#" role="tab" aria-controls="nav-especies" aria-selected="true">
              <i class="fas fa-paw"></i> Especies ${especiesCount}
            </a> 
          </div>
          <table class="table table-sm" collection="${areaProtegida.especies}">
              <thead>
                  <g:sortableColumn property="especie" title="Especie"><th scope="col"></th></g:sortableColumn>
                  <g:sortableColumn property="nombre_cientifico" title="Nombre científico" ><th scope="col"></th></g:sortableColumn>
                  <g:sortableColumn property="nombre_comun" title="Nombre común" ><th scope="col"></th></g:sortableColumn>
                  <g:sortableColumn property="origen" title="Origen" ><th scope="col"></th></g:sortableColumn>
                  <g:sortableColumn property="endemica" title="Endémica"><th scope="col"></th></g:sortableColumn>
                  <g:sortableColumn property="genero" title="Género" ><th scope="col"></th></g:sortableColumn>
              </thead>
              <tbody>
                  <g:each in="${areaProtegida.especies}" var="especie">
                  <tr>
                      <td>${especie.especie}</td>
                      <td>${especie.nombre_cientifico}</td>
                      <td>${especie.nombre_comun}</td>
                      <td>${especie.origen}</td>
                      <td>${especie.endemica}</td>
                      <td>${especie.genero}</td>
                  </tr>
                  </g:each>
              </tbody>

          </table>
          <div class="pagination">
              <g:paginate controller="areaProtegida" action="showEspecies" namespace="public" total="${especiesCount}"/>
          </div>
        </nav>
      </div>
    </body>
</html>