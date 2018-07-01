<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="public"/>
        <title>Editar ${areaProtegida.parque}</title>
    </head>
    <body>
        <div id="edit-areaProtegida" class="content scaffold-edit" role="main">
            <div class="col-md-8 offset-md-2">
                <h1 class="h4 font-weight-normal text-center text-dark pb-2">Editar ${areaProtegida.parque}</h1>
                <g:render template="/templates/flashTemplate"/>
                <g:hasErrors bean="${this.areaProtegida}">
                    <div class="alert alert-danger" role="alert">
                        No pudo crearse el área protegida. Se han encontrado errores...
                    </div>
                </g:hasErrors>
                <g:form mapping="/admin/areas-protegidas/actualizar" resource="${this.areaProtegida}" method="PUT" bean="areaProtegida">
                    <g:hiddenField name="version" value="${this.areaProtegida?.version}" />
                    <g:render template="form"/>
                </g:form>
            </div>
        </div>
    </body>
</html>
