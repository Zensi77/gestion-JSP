<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
        integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/registro/style/login.css">
</head>

<body>
<h1>Iniciar Sesion</h1>

<form action="loginServlet.jsp" method="post" class="needs-validation">
    <div class="form-group">
        <label for="mail">Direccion email</label>
        <input type="email" class="form-control" id="mail" name="mail" aria-describedby="emailHelp"
               placeholder="Introduce email" value="user@user.es">
        <small id="emailHelp" class="form-text text-muted">Nunca compartiremos tu correo electr&oacute;nico con
            nadie
            m&aacute;s.
        </small>
    </div>
    <div class="form-group">
        <label for="password">Contrase&ntilde;a</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="Contrase&ntilde;a"
               value="user">
    </div>
    <div class="form-group form-check">
        <input type="checkbox" class="form-check-input" id="recuerdame">
        <label class="form-check-label" for="recuerdame">Recuerdame</label>
    </div>
    <button type="submit" class="btn btn-primary">Aceptar</button>
    <div style="margin-top: 20px;">
        <small id="registro" class="text-info">Todav&iacute;a no est&aacute;s registrado?,
            Reg&iacute;strate</small><br>
        <button type="button" class="btn btn-secondary"
                onclick="location.href='/registro/registro.jsp'">Registrarse
        </button>

    </div>
</form>
</body>

</html>