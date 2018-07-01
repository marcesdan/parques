<!DOCTYPE html>
<html>
  <head>
      <meta name="layout" content="public" />
  </head>
  <body>
    <g:render template="/templates/flashTemplate"/>
    <ul class="nav nav-tabs">
      <li class="nav-item">
        <a class="nav-link active text-success" aria-selected="true">
          <i class="fas fa-table"></i><strong> Areas protegidas</strong>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-success" href="/admin/areas-protegidas/nueva">
          <i class="fas fa-plus"></i><strong> Nueva área protegida</strong>
        </a>
      </li>
    </ul>
    <div class="table-responsive-sm">
      <table id="table" class="table table-striped table-bordered compact table-sm dt-responsive nowrap shadow" style="width:100%">
        <thead>
          <tr class="text-dark">
            <th class="text-center">Área protegida</th>
            <th class="text-center">Region</th>
            <th class="text-center">Provincia</th>
            <th class="text-center">Localidad</th>
            <th class="text-center">Acciones</th>
          </tr>
        </thead>
        <g:each in="${areaProtegidaList}" var="areaProtegida">
          <tr class="item${areaProtegida.id} text-dark">
            <td>
              <a href="/areas-protegidas/${areaProtegida.slug}" class="text-success">
                <strong>${areaProtegida.parque}</strong>
              </a>
            </td>
            <td>${areaProtegida.delegacion}</td>
            <td>${areaProtegida.provincia}</td>
            <td>${areaProtegida.localidad}</td>
            <td>
              <div class="text-center">
                <a href="/admin/areas-protegidas/mostrar/${areaProtegida.slug}" class="btn btn-success btn-sm" role="button"><i class="far fa-eye"></i></a>
                <a href="/admin/areas-protegidas/editar/${areaProtegida.slug}" class="btn btn-warning btn-sm" role="button"><i class="far fa-edit"></i></a>
                <button class="btn btn-danger btn-sm delete-modal" data-info="${areaProtegida.id},${areaProtegida.parque}">
                  <i class="far fa-trash-alt"></i>
                </button>
              </div>
            </td>
          </tr>
        </g:each>
      </table>
    </div>
    <g:render template="modalDelete"/>
    <content tag="scripts">
      <asset:javascript src="parques/areaProtegida/init-areas-protegidas-privado.js"/>
      <asset:javascript src="ajax-delete-ap.js"/>
    </content>
  </body>
</html>
