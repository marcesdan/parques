<!doctype html>
<html>
    <head>
        <title>Página no encontrada</title>
        <meta name="layout" content="public">
        <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    </head>
    <body>
        <ul class="errors">
            <li>Error: No se pudo encontrar la página solicitada (404)</li>
            <li>Path: ${request.forwardURI}</li>
        </ul>
    </body>
</html>
