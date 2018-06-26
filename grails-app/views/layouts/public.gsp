<!doctype html>
<html lang="es-AR">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- favicon -->
    <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" /> 
    <title>
        <g:layoutTitle default="SIB | Sistema de Información de Biodiversidad, Parques Nacionales, Argentina"/>
    </title>

    <!-- fontawesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

    <!-- Bootstrap -->
    <asset:stylesheet src="bootstrap/bootstrap.min.css"/>

    <!-- Datatables -->
    <asset:stylesheet src="datatables/dataTables.bootstrap4.css"/>
    <asset:stylesheet src="datatables/buttons.bootstrap4.min.css"/>
    <asset:stylesheet src="datatables/responsive.bootstrap4.min.css"/>

    <!-- Otros -->
    <asset:stylesheet src="toastr.min.css"/>
    <asset:stylesheet src="select2.min.css"/>

    <!-- Personalizados -->
    <asset:stylesheet src="styles.css"/>

    <g:layoutHead/>
</head>
<body>
  <nav class="navbar navbar-dark navbar-expand-md fixed-top shadow">
      <!--<a class="navbar-brand" href="#"></a>-->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
      </button>
      <div class="navbar-brand">
        <a href="/"><asset:image src="logos/logo_sib_55x50.png" width="50" height="50"/></a>
        <a href="/"><asset:image src="logos/logo_apn_55x55.png" width="50" height="50"/></a>
      </div>
      <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav ml-auto pr-4">
              <li class="nav-item">
                  <a class="nav-link" href="/">AREAS PROTEGIDAS</a>
              </li>
              <sec:ifNotLoggedIn>
                <li class="nav-item">
                    <a class="nav-link" href="/admin">ADMINISTRACIÓN</a>
                </li>
              </sec:ifNotLoggedIn>
              <sec:ifLoggedIn>
                  <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">ADMINISTRACIÓN</a>
                    <div class="dropdown-menu">
                      <a class="dropdown-item" href="/admin"><i class="fas fa-table"></i> Listado de áreas</a>
                      <a class="dropdown-item" href="/admin/areas-protegidas/nueva"><i class="fas fa-plus"></i> Nueva área</a>
                      <g:form method="post" url="/admin/areas-protegidas/cargarDatos">
                        <button type="submit" class="dropdown-item"><i class="fas fa-database"></i> Cargar datos</button>
                      </g:form>
                      <div role="separator" class="dropdown-divider"></div>
                      <g:form method="post" url="/logout">
                        <button type="submit" class="dropdown-item"><i class="fas fa-sign-out-alt"></i> Salir</button>
                      </g:form>
                    </div>
                  </li>
              </sec:ifLoggedIn>
          </ul>
      </div>
  </nav>
  <main role="main">
    <div class="container">
      <g:layoutBody/>
    </div>
  </main>
  <footer class="footer shadow pb-2 pt-3 pl-4 pr-4 mt-3">
    <div class="container pt-3">
      <h4 class="text-white">
        Sistema de Información de Biodiversidad de la Administración de Parques Nacionales, Argentina
      </h4>
      <p class="text-white pt-3">
        En el SIB recopilamos, clasificamos, ordenamos y ponemos a disposición pública la información de carácter biológico sobre las especies y áreas protegidas de Argentina
      </p>
      <div class="text-white text-right">
        <i class="fas fa-code"></i> con <i class="text-danger fas fa-heart"></i> por marces 
        <a href="https://github.com/marcesdan/parques"><i class="fab fa-github text-white"></i></a>
      </div>
    </div>
  </footer>

  <div id="scripts">

    <!-- gmaps.js (librería para google maps) -->
    <asset:javascript src="gmaps.js"/>

    <!-- JQuery y bootstrap -->
    <asset:javascript src="jquery-3.3.1.min.js"/>
    <asset:javascript src="popper.min.js"/>
    <asset:javascript src="bootstrap/bootstrap.min.js"/>

    <!-- Datatables -->
    <asset:javascript src="datatables/jquery.dataTables.min.js"/>
    <asset:javascript src="datatables/dataTables.bootstrap4.min.js"/>
    <asset:javascript src="datatables/dataTables.buttons.min.js"/>
    <asset:javascript src="datatables/buttons.bootstrap4.min.js"/>
    <asset:javascript src="datatables/dataTables.responsive.min.js"/>
    <asset:javascript src="datatables/responsive.bootstrap4.min.js"/>
    <asset:javascript src="datatables/jszip.min.js"/>
    <asset:javascript src="datatables/buttons.html5.min.js"/>
    <asset:javascript src="datatables/buttons.print.min.js"/>
    <asset:javascript src="datatables/buttons.colVis.min.js"/>
    <asset:javascript src="datatables/buttons.flash.min.js"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
    
    <!-- Notificaciones toastr -->
    <asset:javascript src="toastr.min.js"/>    

    <!-- Select2 -->
    <asset:javascript src="select2/select2.min.js"/>
    <asset:javascript src="select2/select2-es.js"/>
    
     <!-- luego irían los scripts de los hijos -->
    <g:applyLayout name="scriptsLayout">
        <g:pageProperty name="page.scripts" />
    </g:applyLayout>

  </div>
</body>
</html>
