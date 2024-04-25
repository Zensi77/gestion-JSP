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
            <td><a href="home.jsp?action=info&id=<%=id%>" action="info"><span
                    class="material-symbols-outlined">info</span></a></td>
            <td><a href="home.jsp?action=edit&id=<%=id%>"><span class="material-symbols-outlined">edit</span></a></td>
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


<% if (action.equals("info")) { %>
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

        <% if (action.equals("edit")) {
    String sql = "SELECT * FROM pelicula WHERE id=" + request.getParameter("id");
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

    <form action="" class="needs-validation">
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
                <button class="btn btn-primary" type="submit" style="margin: 10px 0 10 0;">Confirmar cambios</button>
            </div>
        </div>
    </form>


    <h3>Lista de actores</h3>

        <%
        String sqlActores = "SELECT persona.* FROM persona INNER JOIN actor ON persona.id = actor.id_persona WHERE actor.id_pelicula=" + request.getParameter("id");
        ResultSet rsActores = st.executeQuery(sqlActores);
    %>

    <ul class="list-group">
        <% while (rsActores.next()) {
            int id = rsActores.getInt(1); %>

        <div style="display: flex; justify-content: space-around;">
            <li class="list-group-item" style="width:95%;">
                <%=id%>. <%= rsActores.getString(2) %> <%= rsActores.getString(3) %>
            </li>
            <a href="home" style="align-self: center" id="<%=id%>">
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

    <h3>
            <%} %>

            <% if (action.equals("deleteMovie")) { %>
            <% 
            int id = Integer.parseInt(request.getParameter("id"));
            Statement statement = con.createStatement();
            
            String sql = "DELETE FROM pelicula WHERE id=" + id;
            statement.executeUpdate(sql); 

            out.println("<script> alert('Película eliminada correctamente'); location.href = 'home.jsp?action=showAllMovies';</script>");
            %>




            <% } %>

            <% if (action.equals("newMovie")) { %>
        <h2>Insertar nueva película</h2>
        <form action="insertMovie" method="post">
            <div class="custom-file">
                <input type="file" class="custom-file-input" id="customFileLang" lang="es">
                <label class="custom-file-label" for="customFileLang">Seleccionar Archivo</label>
            </div>
                <% } %>


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
                        <td><a href="home.jsp?action=infoPersona&id=<%=id%>" action="info"><span
                                class="material-symbols-outlined">info</span></a></td>
                        <td><a href="home.jsp?action=editPersona&id=<%=id%>"><span class="material-symbols-outlined">edit</span></a>
                        </td>
                        <td><a href="home.jsp?action=deletePersona&id=<%=id%>"><span class="material-symbols-outlined">delete</span></a>
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
