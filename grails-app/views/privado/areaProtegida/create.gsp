<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="public"/>
        <title>Nueva área protegida</title>
    </head>
    <body>
      <h1 class="h4 font-weight-normal text-dark text-center pb-2">Nueva área protegida</h1>
      <div class="col-md-8 offset-md-2">
        <g:render template="/templates/flashTemplate"/>
        <g:hasErrors bean="${this.areaProtegida}">
          <div class="alert alert-danger" role="alert">
            No pudo crearse el área protegida. Se han encontrado errores...
          </div>
        </g:hasErrors>
        <g:form method="post" mapping="/admin/areas-protegidas/guardar" resource="${this.areaProtegida}" bean="areaProtegida">
          <g:render template="form"/>
        </g:form>
      </div>
    </body>
</html>
