    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css"
        integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css"
        integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.InputStream" %>
        <%@ include file="../header/header.html" %>
            <% // Vamos a ver si en la petición se nos ha indicado acción y controlador. 
                // Si no, usaremos un controlador y una acción por defecto.
                
                String action=request.getParameter("action"); 
                if ((action==null) || action.equals("")) { action="showAllMovies" ;} // Acción por defecto 
                
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
                        <td><%= id %></td>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getString(4) %></td>
                        <td><%= rs.getString(5) %> min</td>
                        <td><%= rs.getString(6) %></td>
                        <% String ruta = rs.getString(7); 
                            if (ruta == null) {
                                ruta = "https://picsum.photos/100/100";
                            }
                        %>
                        <td><img src='<%=ruta%>'></td>
                        <td><a href="home.jsp?action=info&id=<%=id%>" action="info"><span class="material-symbols-outlined">info</span></a></td>
                        <td><a href="home.jsp?action=edit&id=<%=id%>"><span class="material-symbols-outlined">edit</span></a></td>
                        <td><a href="home.jsp?action=delete&id=<%=id%>"><span class="material-symbols-outlined">delete</span></a></td>
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
                        <td><%= rsPelicula.getString(2) %></td>
                        <td><%= rsPelicula.getString(3) %></td>
                        <td><%= rsPelicula.getString(4) %></td>
                        <td><%= rsPelicula.getString(5) %> min</td>
                        <td><%= rsPelicula.getString(6) %></td>
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
                        <td><%= rsActores.getString(2) %></td>
                        <td><%= rsActores.getString(3) %></td>
                        <td><%= rsActores.getString(4) %></td>
                        <td><%= rsActores.getString(5) %></td>
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
                        <td><%= rsDirectores.getString(2) %></td>
                        <td><%= rsDirectores.getString(3) %></td>
                        <td><%= rsDirectores.getString(4) %></td>
                        <td><%= rsDirectores.getString(5) %></td>
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

<% if (action.equals("edit")) { %>
    <h2>Editar película</h2>
    <p>Editar película</p>
    
<% } %>

<% if (action.equals("delete")) { %>
    <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<% } %>

<% if (action.equals("newMovie")) { %>
    <h2>Insertar nueva película</h2>
    <form action="insertMovie" method="post">
        <div class="custom-file">
    <input type="file" class="custom-file-input" id="customFileLang" lang="es">
    <label class="custom-file-label" for="customFileLang">Seleccionar Archivo</label>
    </div>


<% } %>
