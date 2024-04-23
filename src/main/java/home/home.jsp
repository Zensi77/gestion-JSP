<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@page import="java.sql.*" %>
        <%@include file="../header/header.html" %>
            <% // Vamos a ver si en la petición se nos ha indicado acción y controlador. 
                // Si no, usaremos un controlador y una acción por defecto.
                
                String action=request.getParameter("action"); 
                if ((action==null) || action.equals("")) { action="home/showAllMovies" ;} // Acción por defecto } 
                
                /**************** MOVIES*******************/ 


                // ----showAllMovies---- 
// Verificar si la acción es "showAllMovies"
if (action.equals("home/showAllMovies")) {
    out.println("<h2>Listado de películas</h2>");
    try {
        // Conexión a la base de datos
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://mysql_db:3306/peliculas", "root", "root");

        // Ejecutar una consulta SELECT
        Statement st = con.createStatement();
        String sql = "SELECT * FROM movies";
        ResultSet rs = st.executeQuery(sql);

        // Mostrar los resultados como una tabla HTML
%>
        <div class="container">
            <table align="center">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Título</th>
                        <th>Año</th>
                        <th>País</th>
                        <th>Duración</th>
                        <th>Cartel</th>
                        <th colspan="3">Acciones</th>
                    </tr>
                </thead>
                <tbody>
<%
        while (rs.next()) {
%>
                    <tr>
                        <td><%= rs.getString("id") %></td>
                        <td><%= rs.getString("title") %></td>
                        <td><%= rs.getString("year") %></td>
                        <td><%= rs.getString("country") %></td>
                        <td><%= rs.getString("duration") %> min</td>
                        <td><img src="https://educacionadistancia.juntadeandalucia.es/centros/almeria/pluginfile.php/962384/mod_folder/content/0/images/<%= rs.getString("poster") %>" height="150px"></td>
                        <td><a href="#">Detalles</a></td>
                        <td><a href="#">Modificar</a></td>
                        <td><a href="#">Borrar</a></td>
                    </tr>
<%
        }
%>
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

