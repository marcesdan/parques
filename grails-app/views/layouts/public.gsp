<!doctype html>
<html lang="es-AR">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>
        <g:layoutTitle default="SIB | Sistema de Información de Biodiversidad, Parques Nacionales, Argentina"/>
    </title>

    <!-- favicon -->
    <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" /> 

    <!-- fontawesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">

    <!-- datatable bootstrap4 css -->
    <!-- <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">-->
    <asset:stylesheet src="dataTables.bootstrap4.css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.bootstrap4.min.css">
    
    <!-- bootstrap styles -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

    <!-- toastr notifications -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">

    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.bootstrap4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.colVis.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.1/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.1/js/responsive.bootstrap4.min.js"></script>

    <!-- toastr notifications -->
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

    <!-- select2 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

    <!-- Custom styles -->
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
                      <a class="dropdown-item" href="/admin/area/nueva"><i class="fas fa-plus"></i> Nueva área</a>
                      <g:form method="post" url="/admin/area/cargarDatos">
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
  <footer class="footer shadow p-4 mt-2">
    <div class="container pt-3">
      <h4 class="text-white">
        Sistema de Información de Biodiversidad de la Administración de Parques Nacionales, Argentina
      </h4>
      <p class="text-white pt-3">
        En el SIB recopilamos, clasificamos, ordenamos y ponemos a disposición pública la información de carácter biológico sobre las especies y áreas protegidas de Argentina
      </p>
    </div>
  </footer>
</body>
</html>
