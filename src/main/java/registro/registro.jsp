<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
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
    <h1>Registro</h1>
    <form action="resigtoServlet.jsp" class="needs-validation" novalidate>
        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" required>
            <div class="valid-feedback">
                    Introduzca un nombre valido.
        </div>
        </div>
            <div class="col-md-6 mb-3">
                <label for="apellido">Apellido</label>
                <input type="text" class="form-control" id="apellido" required>
                <div class="valid-feedback">
                    Introduzca un apellido valido.
                </div>
            </div>
        </div>

        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="usuario">Usuario</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                    </div>
                    <input type="text" class="form-control" id="usuario" placeholder="Username"
                        aria-describedby="inputGroupPrepend" required>
                    <div class="invalid-feedback">
                        Elije un nombre de usuario valido.
                    </div>
                </div>
            </div>

            <div class="col-md-2 mb-3">
                <label for="ciudad">Ciudad</label>
                <input type="text" class="form-control" id="ciudad">
                <div class="invalid-feedback">
                    Introduzca una ciudad valida.
                </div>
            </div>

            <div class="col-md-4 mb-3">
                <label for="fecha_nacimiento">Fecha Nacimiento</label>
                <input type="date" class="form-control" id="fecha_nacimiento" required>
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" placeholder="">
                <div class="invalid-feedback">
                    Por favor, introduzca una dirección de correo electrónico válida.
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <label for="password">Contrase&ntilde;a</label>
                <input type="password" class="form-control" id="password" required>
                <div class="invalid-feedback">
                    Por favor, introduzca una contrase&ntilde;a valida.
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="condiciones" required>
                <label class="form-check-label" for="condiciones">
                    Acepto los terminos y condiciones
                </label>
                <div class="invalid-feedback">
                    Debes estar de acuerdo antes de enviar
                </div>
            </div>
        </div>
        <div style="text-align: center;">
            <button class="btn btn-primary" type="submit">Aceptar</button><br><br>
            <button class="btn btn-secondary" onclick="location.href='../index.jsp'">Cancelar</button>
        </div>
    </form>

    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict';
            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</body>

</html>