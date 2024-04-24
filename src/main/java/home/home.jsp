    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css"
        integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css"
        integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"
        integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
        crossorigin="anonymous"></script>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@page import="java.sql.*" %>
        <%@ include file="../header/header.html" %>
            <% // Vamos a ver si en la petición se nos ha indicado acción y controlador. 
                // Si no, usaremos un controlador y una acción por defecto.
                
                String action=request.getParameter("action"); 
                if ((action==null) || action.equals("")) { action="showAllMovies" ;} // Acción por defecto } 
                


    if (action.equals("showAllMovies")) { 
%>
    <h2>Listado de películas</h2>
    <%
    try {
        String envURL = System.getenv("JDBC_URL");
        String envUser = System.getenv("JDBC_USER");
        String envPass = System.getenv("JDBC_PASSWORD");

        // Conexión a la base de datos
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(envURL, envUser, envPass);

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
                        <td><%= rs.getString(1) %></td>
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
                        <td><a href="#">Detalles</a></td>
                        <td><a href="#">Modificar</a></td>
                        <td><a href="#">Borrar</a></td>
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


<% if (action.equals("newMovie")) { %>
    <h2>Insertar nueva película</h2>
    <form action="insertMovie" method="post">
        <div class="custom-file">
    <input type="file" class="custom-file-input" id="customFileLang" lang="es">
    <label class="custom-file-label" for="customFileLang">Seleccionar Archivo</label>
    </div>


<% } %>
