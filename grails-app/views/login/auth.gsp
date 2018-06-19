<!DOCTYPE html>
<html>
  <head>
      <meta name="layout" content="public"/>
      <asset:stylesheet src="form-signin.css"/>
  </head>
  <body class="text-center">
    <g:if test='${flash.message}'>
      <div class="row">
        <div class="col-md-8 offset-md-2">
          <div class="card text-center border-danger w-100">
            <div class="card-body text-danger">
              <p class="card-title">${flash.message}</p>
            </div>
          </div>
        </div>
      </div>
    </g:if>
    <form class="form-signin mt-2" action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm">
      <div class="text-center">
        <asset:image class="mb-4 img-" src="/logos/logo_apn_55x55.png" alt="" width="72" height="72"/>
      </div>
      <h1 class="h3 mb-3 font-weight-normal text-center">Ingresá como admin!</h1>
      <label for="username" class="sr-only">Usuario</label>
      <input type="text" class="form-control" id="username" name="${usernameParameter ?: 'username'}" placeholder="Usuario" required autofocus>
      <label for="password" class="sr-only">Contraseña</label>
      <input class="form-control" class="form-control" type="password" id="password" name="${passwordParameter ?: 'password'}" placeholder="Contraseña" required>
      <div class="checkbox mb-3 text-center">
        <label>
          <input type="checkbox" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/> Recordame
        </label>
      </div>
      <button class="btn btn-lg btn-success btn-block" type="submit">Login</button>
      <p class="mt-5 mb-3 text-muted text-center">&copy; marces 2017-2018</p>
    </form>
  </body>
</html>
