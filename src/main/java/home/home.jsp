<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css"
      integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>

<link rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"/>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.InputStream" %>
<%@ include file="../header/header.html" %>
<% // Vamos a ver si en la petición se nos ha indicado acción y controlador.
    // Si no, usaremos un controlador y una acción por defecto.

    String action = request.getParameter("action");
    if ((action == null) || action.equals("")) {
        action = "showAllMovies";
    } // Acción por defecto

    String envURL = System.getenv("JDBC_URL");
    String envUser = System.getenv("JDBC_USER");
    String envPass = System.getenv("JDBC_PASSWORD");

    // Conexión a la base de datos
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(envURL, envUser, envPass);


// Mostrar todas las películas
    if (action.equals("showAllMovies")) {
%>
<h2>Listado de películas</h2>
<%
    try {
        // Ejecutar una consulta SELECT
        Statement st = con.createStatement();
        String sql = "SELECT * FROM pelicula";
        ResultSet rs = st.executeQuery(sql);
%>
<div class="container">
    <table align="center" class="table table-hover">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Título</th>
            <th scope="col">Director</th>
            <th scope="col">Género</th>
            <th scope="col">Duración</th>
            <th scope="col">Año</th>
            <th scope="col">Cartel</th>
            <th scope="col" colspan="3">Acciones</th>
        </tr>
        </thead>
        <tbody>
        <% while (rs.next()) { %>
        <tr>
            <% int id = Integer.parseInt(rs.getString(1)); %>
            <td><%= id %>
            </td>
            <td><%= rs.getString(2) %>
            </td>
            <td><%= rs.getString(3) %>
            </td>
            <td><%= rs.getString(4) %>
            </td>
            <td><%= rs.getString(5) %> min</td>
            <td><%= rs.getString(6) %>
            </td>
            <% String ruta = rs.getString(7);
                if (ruta == null) {
                    ruta = "https://picsum.photos/100/100";
                }
            %>
            <td><img src='<%=ruta%>'></td>
            <td><a href="home.jsp?action=infoMovie&id=<%=id%>" action="home.jsp?infoMovie"><span
                    class="material-symbols-outlined">info</span></a></td>
            <td><a href="home.jsp?action=editMovie&id=<%=id%>"><span class="material-symbols-outlined">edit</span></a>
            </td>
            <td><a href="home.jsp?action=deleteMovie&id=<%=id%>"><span
                    class="material-symbols-outlined">delete</span></a></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
<%
            // Cerrar recursos
            rs.close();
            st.close();
            con.close();
        } catch (Exception e) {
            out.println("Error al acceder a la BD: " + e.toString());
        }
    }
%>


<!-- Insertar película -->
<% if (action.equals("newMovie")) { %>
<h2>Insertar película</h2>

<form class="needs-validation">
    <div class="form-row">
        <div class="col-md-6 mb-3">
            <label for="director">Titulo</label>
            <input type="text" class="form-control" id="director" name="director">
        </div>
        <div class="form-row">
            <div class="col-md-3 mb-3">
                <label for="genero">Género</label>
                <input type="text" class="form-control" id="genero" name="genero">
            </div>
            <div class="col-md-3 mb-3">
                <label for="duracion">Duración</label>
                <input type="text" class="form-control" id="duracion" name="duracion">
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-3 mb-3">
                <label for="anio">Año</label>
                <input type="text" class="form-control" id="anio" name="anio">
            </div>
            <div class="col-md-6 mb-4">
                <label class="custom-file-label" for="customFileLang">Seleccionar Archivo</label>
                <input type="file" class="custom-file-input" id="customFileLang" lang="es">
            </div>
        </div>
    </div>
    <%
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM persona");
    %>
    <br>

    <table class="table table-bordered" style="margin: 1%">
        <thead>
        <tr>
            <th scope="col">Actores / Dirección</th>
            <th scope="col">Nombre</th>
            <th scope="col">Actores / Dirección</th>
            <th scope="col">Apellido</th>
            <th scope="col">Actores / Dirección</th>
            <th scope="col">Acción</th>
        </tr>
        </thead>
        <tbody>
        <% int counter = 0; %>
        <% while (rs.next() && counter < 3 * 100) { %>
        <tr>
            <td>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="actor_<%= rs.getInt(1) %>" value="actor">
                    <label class="form-check-label">Actor</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="director_<%= rs.getInt(1) %>"
                           value="director">
                    <label class="form-check-label">Dirección</label>
                </div>
            </td>
            <td><%= rs.getString(2) %> <%= rs.getString(3) %>
            </td>
            <%
                int actorId = rs.getInt(1);
                for (int i = 0; i < 2; i++) {
                    if (rs.next()) {
            %>
            <td>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="actor_<%= rs.getInt(1) %>" value="actor">
                    <label class="form-check-label">Actor</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="director_<%= rs.getInt(1) %>"
                           value="director">
                    <label class="form-check-label">Dirección</label>
                </div>
            </td>
            <td><%= rs.getString(2) %> <%= rs.getString(3) %>
            </td>
            <%
                    }
                }
                counter += 3;
            %>
        </tr>
        <% } %>
        </tbody>
    </table>
    <button class="btn btn-primary" type="submit" style="margin: 10px 0 10 0;">Agregar personas</button>
</form>
<% } %>


<!-- Mostrar personas -->
<% if (action.equals("showPeople")) { %>
<h2>Listado de personas</h2>
<%
    try {
        // Ejecutar una consulta SELECT
        Statement st = con.createStatement();
        String sql = "SELECT * FROM persona";
        ResultSet rs = st.executeQuery(sql);
%>

<div class="container">
    <table align="center" class="table table-hover">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Nombre</th>
            <th scope="col">Apellido</th>
            <th scope="col">Año de nacimiento</th>
            <th scope="col">Ciudad</th>
            <th scope="col">Foto</th>
            <th scope="col" colspan="3">Acciones</th>
        </tr>
        </thead>
        <tbody>
        <% while (rs.next()) { %>
        <tr>
            <% int id = Integer.parseInt(rs.getString(1)); %>
            <td><%= id %>
            </td>
            <td><%= rs.getString(2) %>
            </td>
            <td><%= rs.getString(3) %>
            </td>
            <td><%= rs.getString(4) %>
            </td>
            <td><%= rs.getString(5) %>
            </td>
            <% String ruta = rs.getString(6);
                if (ruta == null) {
                    ruta = "https://picsum.photos/50/50";
                }
            %>
            <td><img src='<%=ruta%>'></td>
            <td><a href="home.jsp?action=infoPerson&id=<%=id%>" action="info"><span
                    class="material-symbols-outlined">info</span></a></td>
            <td><a href="home.jsp?action=editPerson&id=<%=id%>"><span class="material-symbols-outlined">edit</span></a>
            </td>
            <td><a href="home.jsp?action=deletePerson&id=<%=id%>"><span
                    class="material-symbols-outlined">delete</span></a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>

</div>

<% } catch (SQLException e) {
    out.println("Error al acceder a la BD: " + e.toString());
}
}
%>


<!-- Insertar persona -->
<% if (action.equals("insertPerson")) { %>

<h2>Insertar persona</h2>

<form action="home.jsp?action=insertPersonOk" method="post" class="needs-validation">
    <div class="form-row">
        <div class="col-md-6 mb-3">
            <label for="nombre">Nombre</label>
            <input type="text" class="form-control" id="nombre" name="nombre">
        </div>
        <div class="col-md-6 mb-3">
            <label for="apellido">Apellido</label>
            <input type="text" class="form-control" id="apellido" name="apellido">
        </div>
    </div>
    <div class="form-row">
        <div class="col-md-3 mb-3">
            <label for="anio">Año de nacimiento</label>
            <input type="date" class="form-control" id="anio" name="anio">
        </div>
        <div class="col-md-3 mb-3">
            <label for="ciudad">Ciudad</label>
            <input type="text" class="form-control" id="ciudad" name="ciudad">
        </div>
        <div class="col-md-3 mb-3">
            <label for="foto">Foto</label>
            <input type="file" class="custom-file-input" id="foto" name="foto">
        </div>
    </div>
    <div class="form-row">
        <div class="col-md-12"> <!-- Coloca el botón en una fila separada -->
            <button class="btn btn-primary" type="submit" style="margin: 10px 0 10 0;">Crear persona</button>
        </div>
    </div>
</form>
<% } %>



<% if (action.equals("infoMovie")) { %>
<h2>Información de la película</h2>
<div class="container">
    <table align="center" class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Título</th>
            <th scope="col">Director</th>
            <th scope="col">Género</th>
            <th scope="col">Duración</th>
            <th scope="col">Año</th>
            <th scope="col">Cartel</th>
        </tr>
        </thead>
        <tbody>
        <% try {
            Statement st = con.createStatement();
            String sqlPelicula = "SELECT * FROM pelicula WHERE id=" + request.getParameter("id");
            ResultSet rsPelicula = st.executeQuery(sqlPelicula);
            while (rsPelicula.next()) { %>
        <tr>
            <td><%= rsPelicula.getString(2) %>
            </td>
            <td><%= rsPelicula.getString(3) %>
            </td>
            <td><%= rsPelicula.getString(4) %>
            </td>
            <td><%= rsPelicula.getString(5) %> min</td>
            <td><%= rsPelicula.getString(6) %>
            </td>
            <%
                String ruta = rsPelicula.getString(7);
                if (ruta == null) {
                    ruta = "https://picsum.photos/100/100";
                }
            %>
            <td><img src='<%= ruta %>'></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<h2>Actores de la película</h2>
<div class="container">
    <table align="center" class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Nombre</th>
            <th scope="col">Apellido</th>
            <th scope="col">A&ntilde;o de nacimiento</th>
            <th scope="col">Ciudad</th>
            <th scope="col">Foto</th>
        </tr>
        </thead>
        <tbody>
        <%
            String sqlActores = "SELECT persona.* FROM persona INNER JOIN actor ON persona.id = actor.id_persona WHERE actor.id_pelicula=" + request.getParameter("id");
            ResultSet rsActores = st.executeQuery(sqlActores);
            while (rsActores.next()) { %>
        <tr>
            <td><%= rsActores.getString(2) %>
            </td>
            <td><%= rsActores.getString(3) %>
            </td>
            <td><%= rsActores.getString(4) %>
            </td>
            <td><%= rsActores.getString(5) %>
            </td>
            <%
                String ruta = rsActores.getString(6);
                String realPath = application.getRealPath(ruta); // Obtiene la ruta real en el sistema de archivos del servidor
                File file = new File(realPath);
                if (!file.exists()) {
                    ruta = "https://picsum.photos/50/50";
                }
            %>
            <td><img src='<%= ruta %>'></td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

<h2>Direccion de la película</h2>
<div class="container">
    <table align="center" class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Nombre</th>
            <th scope="col">Apellido</th>
            <th scope="col">A&ntilde;o de nacimiento</th>
            <th scope="col">Ciudad</th>
            <th scope="col">Foto</th>
        </tr>
        </thead>
        <tbody>
        <%
            String sqlDirectores = "SELECT persona.* FROM persona INNER JOIN direccion_pelicula ON persona.id = direccion_pelicula.id_persona WHERE direccion_pelicula.id_pelicula=" + request.getParameter("id");
            ResultSet rsDirectores = st.executeQuery(sqlDirectores);
            while (rsDirectores.next()) { %>
        <tr>
            <td><%= rsDirectores.getString(2) %>
            </td>
            <td><%= rsDirectores.getString(3) %>
            </td>
            <td><%= rsDirectores.getString(4) %>
            </td>
            <td><%= rsDirectores.getString(5) %>
            </td>
            <%
                String ruta = rsDirectores.getString(6);
                String realPath = application.getRealPath(ruta); // Obtiene la ruta real en el sistema de archivos del servidor
                File file = new File(realPath);
                if (!file.exists()) {
                    ruta = "https://picsum.photos/50/50";
                }
            %>
            <td><img src='<%= ruta %>'></td>
        </tr>
        <% } %>
        </tbody>
    </table>

        <%
    // Cerrar recursos
    rsPelicula.close();
    st.close();
    con.close();
} catch (Exception e) {
    out.println("Error al acceder a la BD: " + e.toString());
} %>

        <% } %>

        <% if (action.equals("editMovie")) {
            int id = Integer.parseInt(request.getParameter("id"));
    String sql = "SELECT * FROM pelicula WHERE id=" + id;
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(sql);

    rs.next();
    String titulo = rs.getString(2);
    String director = rs.getString(3);
    String genero = rs.getString(4);
    String duracion = rs.getString(5);
    String anio = rs.getString(6);

%>
    <h2>Editar película</h2>

    <form action="home.jsp?action=editMovieOk&id=<%=id%>" class="needs-validation" method="post">
        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="titulo">Título</label>
                <input type="text" class="form-control" id="titulo" name="titulo" value="<%=titulo%>">
            </div>
            <div class="col-md-6 mb-3">
                <label for="director">Director</label>
                <input type="text" class="form-control" id="director" name="director" value="<%=director%>">
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-3 mb-3">
                <label for="genero">Género</label>
                <input type="text" class="form-control" id="genero" name="genero" value="<%=genero%>">
            </div>
            <div class="col-md-3 mb-3">
                <label for="duracion">Duración</label>
                <input type="text" class="form-control" id="duracion" name="duracion" value="<%=duracion%>">
            </div>
            <div class="col-md-3 mb-3">
                <label for="anio">Año</label>
                <input type="text" class="form-control" id="anio" name="anio" value="<%=anio%>">
            </div>
            <div class="col-md-3 mb-4">
                <label class="custom-file-label" for="customFileLang">Seleccionar Archivo</label>
                <input type="file" class="custom-file-input" id="customFileLang" lang="es">
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-12"> <!-- Coloca el botón en una fila separada -->
                <button class="btn btn-primary" type="submit" style="margin: 10px 0 10 0;">Confirmar cambios
                </button>
            </div>
        </div>
    </form>



<%
String sqlActores = "SELECT persona.* FROM persona INNER JOIN actor ON persona.id = actor.id_persona WHERE actor.id_pelicula=" + request.getParameter("id");
ResultSet rsActores = st.executeQuery(sqlActores);
boolean h1 = false;
%>

<ul class="list-group">
    <% while (rsActores.next()) {

        if (!h1) { 
            %><h3>Lista de actores</h3><%
            h1 = true; 
        }
    int idActor = rsActores.getInt(1); 
%>



        <div style="display: flex; justify-content: space-around;">
            <li class="list-group-item" style="width:95%;">
                <%= rsActores.getString(2) %> <%= rsActores.getString(3) %>
            </li>
            <a href="home.jsp?action=deleteActorFromMovie&idPelicula=<%=id%>&idActor=<%=idActor%>"
               style="align-self: center" id="<%=id%>">
                <!-- En el href debería ir la ruta de la acción de eliminar -->
                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-circle-minus" width="24"
                     height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50" fill="none"
                     stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                    <path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0"/>
                    <path d="M9 12l6 0"/>
                </svg>
            </a>
        </div>
    <% } %>
</ul> 

        <%
    Statement stDireccion = con.createStatement();
    String sqlDireccion = "SELECT persona.* FROM persona INNER JOIN direccion_pelicula ON persona.id = direccion_pelicula.id_persona WHERE direccion_pelicula.id_pelicula=" + request.getParameter("id");
    ResultSet rsDireccion = st.executeQuery(sqlDireccion);
    boolean h1Dir = false;
    %>

    <ul class="list-group">
        <% while (rsDireccion.next()) {

            if (!h1Dir) { %>      
                <h3>Lista de directores</h3>
                <% h1Dir = true;
            }
            int idDirector = rsDireccion.getInt(1); %>

        <div style="display: flex; justify-content: space-around;">
            <li class="list-group-item" style="width:95%;">
                <%= rsDireccion.getString(2) %> <%= rsDireccion.getString(3) %>
            </li>
            <a href="home.jsp?action=deleteDirectorFromMovie&idPelicula=<%=id%>&idDirector=<%=idDirector%>"
               style="align-self: center" id="<%=id%>">
                <!-- En el href debería ir la ruta de la acción de eliminar -->
                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-circle-minus" width="24"
                     height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50" fill="none"
                     stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                    <path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0"/>
                    <path d="M9 12l6 0"/>
                </svg>
            </a>

        </div>

        <% } %>

    </ul>
        <%} %>

        <% if (action.equals("deleteMovie")) { %>
        <%
            try {
            int id = Integer.parseInt(request.getParameter("id"));
            Statement statement = con.createStatement();
            
            String sql = "DELETE FROM pelicula WHERE id=" + id;
            statement.executeUpdate(sql); 

            out.println("<script> alert('Película eliminada correctamente'); location.href = 'home.jsp?action=showAllMovies';</script>");
            } catch (SQLException e) {
            out.println("<script> alert('No se ha podido eliminar la película'); location.href = 'home.jsp?action=showAllMovies';</script>");
            }
            } %>
        <%

        
    if (action.equals("infoPerson")) {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * FROM persona WHERE id=" + id;
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        if (rs.next()) {
            %>
    <h2>Información de la persona</h2>
    <div class="container">
        <table align="center" class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Nombre</th>
                <th scope="col">Apellido</th>
                <th scope="col">Año de nacimiento</th>
                <th scope="col">Ciudad</th>
                <th scope="col">Foto</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><%= rs.getString(2) %>
                </td>
                <td><%= rs.getNString(3) %>
                </td>
                <td><%= rs.getInt(4) %>
                </td>
                <td><%= rs.getString(5) %>
                </td>
                <%
                    String ruta = rs.getString(6);
                    if (ruta == null) {
                        ruta = "https://picsum.photos/50/50";
                    }
                %>
                <td><img src='<%= ruta %>'></td>
            </tr>
            </tbody>
        </table>
    </div>
        <%
        } %>

    <h2>Peliculas en las que ha participado</h2>

        <%
            String sqlPeliculas = "SELECT pelicula.* FROM pelicula INNER JOIN actor ON pelicula.id = actor.id_pelicula WHERE actor.id_persona=" + id;
            ResultSet rsPeliculas = st.executeQuery(sqlPeliculas);
        %>

    <ul class="list-group" style="margin: 1%">
        <% while (rsPeliculas.next()) { %>
        <li class="list-group-item"><%= rsPeliculas.getString(2) %>
        </li>
        <% } %>
    </ul>

    <h2>Peliculas que ha dirigido</h2>
        <%
            String sqlPeliculasDirigidas = "SELECT pelicula.* FROM pelicula INNER JOIN direccion_pelicula ON pelicula.id = direccion_pelicula.id_pelicula WHERE direccion_pelicula.id_persona=" + id;
            ResultSet rsPeliculasDirigidas = st.executeQuery(sqlPeliculasDirigidas);
        %>

    <ul class="list-group" style="margin: 1%">
            <% while (rsPeliculasDirigidas.next()) { %>
        <li class="list-group-item"><%= rsPeliculasDirigidas.getString(2) %>
        </li>
            <% } %>

    </ul>
    <% } %>





<% 
    if (action.equals("editPerson")) {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * FROM persona WHERE id=" + id;
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);
        rs.next();
        String nombre = rs.getString(2);
        String apellido = rs.getString(3);
        int anio = rs.getInt(4);
        String ciudad = rs.getString(5);
        String foto = rs.getString(6);
%>
    <h2>Editar persona</h2>
    <form action="home.jsp?action=editPersonOk&id=<%=id%>" class="needs-validation" method="post">
        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre" value="<%=nombre%>">
            </div>
            <div class="col-md-6 mb-3">
                <label for="apellido">Apellido</label>
                <input type="text" class="form-control" id="apellido" name="apellido" value="<%=apellido%>">
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-3 mb-3">
                <label for="anio">Año de nacimiento</label>
                <input type="date" class="form-control" id="anio" name="anio" value="<%=anio%>">
            </div>
            <div class="col-md-3 mb-3">
                <label for="ciudad">Ciudad</label>
                <input type="text" class="form-control" id="ciudad" name="ciudad" value="<%=ciudad%>">
            </div>
            <div class="col-md-3 mb-3">
                <label for="foto">Foto</label>
                <input type="file" class="custom-file-input" id="foto" name="foto" value="<%=foto%>">
            </div>
        </div>
        <div class="form-row">
            <div class="col-md-100"> <!-- Coloca el botón en una fila separada -->
                <button class="btn btn-primary" type="submit" style="margin: 10px 0 10 0;">Confirmar cambios
                </button>
            </div>
        </div>
    </form>

    <% 
        boolean h1 = false;
        String sqlPelicula = "SELECT pelicula.* FROM persona INNER JOIN actor ON persona.id = actor.id_persona INNER JOIN pelicula ON pelicula.id = actor.id_pelicula WHERE actor.id_persona=" + request.getParameter("id");
        ResultSet rsPelicula = null;

        try {
            rsPelicula = st.executeQuery(sqlPelicula);
        } catch (SQLException e) {
            out.println("Error al acceder a la BD: " + e.toString());
        }
    %>
    <h3>Lista de películas en las que aparece</h3>
    <ul>
        <% 
            while (rsPelicula.next()) {
                int idPelicula = rsPelicula.getInt(1); 
        %>
        <div style="display: flex; justify-content: space-around;">
            <li class="list-group-item" style="width:95%;">
                <%= rsPelicula.getString(2) %>
            </li>
            <a href="home.jsp?action=deleteMovieFromActor&idPelicula=<%=idPelicula%>&idActor=<%=id%>"
               style="align-self: center" id="<%=id%>">
                <!-- En el href debería ir la ruta de la acción de eliminar -->
                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-circle-minus" width="24"
                     height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50" fill="none"
                     stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                    <path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0"/>
                    <path d="M9 12l6 0"/>
                </svg>
            </a>
        </div>
        <% } %>
    </ul>

    <% 
        boolean h1Dir = false;
        String sqlDir = "SELECT pelicula.* FROM persona INNER JOIN direccion_pelicula ON persona.id = direccion_pelicula.id_persona INNER JOIN pelicula ON pelicula.id = direccion_pelicula.id_pelicula WHERE direccion_pelicula.id_persona=" + id + " ORDER BY pelicula.titulo";
        ResultSet rsDir = null;

        try {
            rsDir = st.executeQuery(sqlDir);
        } catch (SQLException e) {
            out.println("Error al acceder a la BD: " + e.toString());
        }

        while (rsDir.next()) {
            if (!h1Dir) {
        %> 
            <h3>Lista de películas dirigidas</h3>
        <% 
                h1Dir = true;
            }

            int idPelicula = rsDir.getInt(1); 
        %>
        <div style="display: flex; justify-content: space-around;">
            <li class="list-group-item" style="width:95%;">
                <%= rsDir.getString(2) %>
            </li>
            <a href="home.jsp?action=deleteMovieFromDirector&idPelicula=<%=idPelicula%>&idDirector=<%=id%>"
               style="align-self: center" id="<%=id%>">
                <!-- En el href debería ir la ruta de la acción de eliminar -->
                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-circle-minus" width="24"
                     height="24" viewBox="0 0 24 24" stroke-width="1.5" stroke="#2c3e50" fill="none"
                     stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none"/>
                    <path d="M12 12m-9 0a9 9 0 1 0 18 0a9 9 0 1 0 -18 0"/>
                    <path d="M9 12l6 0"/>
                </svg>
            </a>
        </div>
    <% } %>
<% } %>



<% if (action.equals("deletePersona")) {
    try {
        int id = Integer.parseInt(request.getParameter("id"));
        Statement statement = con.createStatement();
        String sql = "DELETE FROM persona WHERE id=" + id;
        int cambios = statement.executeUpdate(sql);
        if(cambios >=1) {
            out.println("<script> alert('Persona eliminada correctamente'); location.href = 'home.jsp?action=showPeople';</script>");
        }else {
            out.println("<script> alert('No se ha podido eliminar la persona'); location.href = 'home.jsp?action=showPeople';</script>");
        }
    } catch (SQLException e) {
    out.println("<script> alert('No se puede eliminar a un actor'); location.href = 'home.jsp?action=showPeople';</script>");
    } 
}%>


<% if (action.equals("editMovieOk")) {
    String id = request.getParameter("id");
    String titulo = request.getParameter("titulo");
    String director = request.getParameter("director");
    String genero = request.getParameter("genero");
    String duracion = request.getParameter("duracion");
    String anio = request.getParameter("anio");

    Statement st = con.createStatement();
    String sql = "UPDATE pelicula SET titulo='" + titulo + "', director='" + director + "', genero='" + genero + "', duracion='" + duracion + "', anio_grabacion='" + anio + "' WHERE id=" + id;
    st.executeUpdate(sql);
    response.sendRedirect("home.jsp?action=editMovie&id=" + id);
}

    if (action.equals("deleteActorFromMovie")) {
        String id = request.getParameter("idActor");
        Statement st = con.createStatement();
        String sql = "DELETE FROM actor WHERE id_persona=" + id + " AND id_pelicula=" + request.getParameter("idPelicula");
        st.executeUpdate(sql);
        response.sendRedirect("home.jsp?action=editMovie&id=" + request.getParameter("idPelicula"));
    }

    if (action.equals("deleteDirectorFromMovie")) {
        String id = request.getParameter("idDirector");
        Statement st = con.createStatement();
        String sql = "DELETE FROM direccion_pelicula WHERE id_persona=" + id + " AND id_pelicula=" + request.getParameter("idPelicula");
        st.executeUpdate(sql);
        response.sendRedirect("home.jsp?action=editMovie&id=" + request.getParameter("idPelicula"));
    }

    if(action.equals("insertPersonOk")) {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String anio = request.getParameter("anio");
        String ciudad = request.getParameter("ciudad");
        int rows = 0;

        try {
            Statement st = con.createStatement();
            String sql = "INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad) VALUES ('" + nombre + "', '" + apellido + "', " + anio + ", '" + ciudad + "')";
            rows = st.executeUpdate(sql);
        } catch (SQLException e) {
            out.println("Error al insertar la persona: " + e.toString());
        }

        if(rows >= 1) {
            out.println("<script> alert('Persona Insertada correctamente'); location.href = 'home.jsp?action=showPeople';</script>");
        } else {
            response.sendRedirect("home.jsp?action=insertPerson");
        }
    }

    if (action.equals("editPersonOk")) {
        String id = request.getParameter("id");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String anio = request.getParameter("anio");
        String ciudad = request.getParameter("ciudad");

        Statement st = con.createStatement();
        String sql = "UPDATE persona SET nombre='" + nombre + "', apellido='" + apellido + "', anio_nacimiento='" + anio + "', ciudad='" + ciudad + "' WHERE id=" + id;
        st.executeUpdate(sql);
        response.sendRedirect("home.jsp?action=editPerson&id=" + id);
    }

    if (action.equals("deleteMovieFromActor")) {
        String id = request.getParameter("idActor");
        Statement st = con.createStatement();
        String sql = "DELETE FROM actor WHERE id_persona=" + id + " AND id_pelicula=" + request.getParameter("idPelicula");
        st.executeUpdate(sql);
        response.sendRedirect("home.jsp?action=editPerson&id=" + request.getParameter("id"));
    }

    if (action.equals("deleteMovieFromDirector")) {
        String id = request.getParameter("idDirector");
        Statement st = con.createStatement();
        String sql = "DELETE FROM direccion_pelicula WHERE id_persona=" + id + " AND id_pelicula=" + request.getParameter("idPelicula");
        st.executeUpdate(sql);
        response.sendRedirect("home.jsp?action=editPerson&id=" + request.getParameter("id"));
    }
%>