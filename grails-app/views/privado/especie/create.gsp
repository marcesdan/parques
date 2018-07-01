<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="public"/>
        <title>Nueva especie</title>
    </head>
    <body>
      <h1 class="h4 font-weight-normal text-dark text-center pb-2">Nueva especie</h1>
      <div class="col-md-8 offset-md-2">
        <g:render template="/templates/flashTemplate"/>
        <g:hasErrors bean="${this.areaProtegida}">
          <div class="alert alert-danger" role="alert">
            No pudo crearse la especie. Se han encontrado errores...
          </div>
        </g:hasErrors>
        <g:form method="post" mapping="/admin/especies/guardar" resource="${this.especie}" bean="especie">
          <g:render template="form"/>
        </g:form>
      </div>
      <content tag="scripts">
        <asset:javascript src="init-select2-genero.js"/>
      </content>
    </body>
</html>
