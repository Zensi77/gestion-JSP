<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@page import="java.sql.*" %>
        <%@include file="../header/header.html" %>
            <% // Vamos a ver si en la petición se nos ha indicado acción y controlador. 
                // Si no, usaremos un controlador y una acción por defecto.
                
                String action=request.getParameter("action"); 
                if ((action==null) || action.equals("")) { action="showAllMovies" ;} // Acción por defecto } 
                


<% if (action.equals("showAllMovies")) { %>
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
            <table align="center">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Título</th>
                        <th>Director</th>
                        <th>Género</th>
                        <th>Duración</th>
                        <th>Año</th>
                        <th>Cartel</th>
                        <th colspan="3">Acciones</th>
                    </tr>
                </thead>
                <tbody>
    <% while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getString(1) %></td>
                        <td><%= rs.getString(2) %></td>
                        <td><%= rs.getString(3) %></td>
                        <td><%= rs.getString(4) %> min</td>
                        <td><%= rs.getString(5) %></td>
                        <td><img src="https://educacionadistancia.juntadeandalucia.es/centros/almeria/pluginfile.php/962384/mod_folder/content/0/images/<%= rs.getString("poster") %>" height="150px"></td>
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
