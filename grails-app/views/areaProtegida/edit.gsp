<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="public"/>
        <title>Editar área protegida</title>
    </head>
    <body>
        <div id="edit-areaProtegida" class="content scaffold-edit" role="main">
            <div class="col-md-8 offset-md-2">
                <h1 class="h2 font-weight-normal text-center pb-2">Editar área protegida</h1>
                <g:render template="/templates/flashTemplate"/>
                <g:hasErrors bean="${this.areaProtegida}">
                    <div class="alert alert-danger" role="alert">
                        No pudo crearse el área protegida. Se han encontrado errores...
                    </div>
                </g:hasErrors>
                <g:form resource="${this.areaProtegida}" method="PUT" bean="areaProtegida">
                    <g:hiddenField name="version" value="${this.areaProtegida?.version}" />
                    <g:render template="formTemplate"/>
                </g:form>
            </div>
        </div>
    </body>
</html>
