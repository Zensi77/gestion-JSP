<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>


<%
/*
Aquí se recogen los datos del formulario de registro y se insertan en la base de datos.
*/
String nombre = request.getParameter("nombre");
String apellido = request.getParameter("apellido");
String usuario = request.getParameter("usuario");
String ciudad = request.getParameter("ciudad");
String fecha_nacimiento = request.getParameter("fecha_nacimiento");
String email = request.getParameter("email");
String password = request.getParameter("password");

out.println(nombre + " " + apellido + " " + usuario + " " + ciudad + " " + fecha_nacimiento + " " + email + " " + password);

Class.forName("com.mysql.cj.jdbc.Driver");
String envURL = System.getenv("JDBC_URL"); // "jdbc:mysql://localhost:3306/peliculas"
String envUser = System.getenv("JDBC_USER"); // "root"
String envPass = System.getenv("JDBC_PASSWORD"); // "root"
Connection con = DriverManager.getConnection(envURL, envUser, envPass);
Statement stmt = con.createStatement();

try {
    int num1 = stmt.executeUpdate("insert into usuario (nombre_usuario, email, contrasena) values ('"+ usuario + "','" + email + "','" + password + "')");
    
    ResultSet rs = stmt.executeQuery("select id from usuario where nombre_usuario = '" + usuario + "'");
    rs.next();
    int idUsuario = rs.getInt("id");

    int num2 =stmt.executeUpdate("insert into persona (nombre, apellido, ciudad, anio_nacimiento, id_usuario) values ('" + nombre + "','" + apellido + "','" + ciudad + "'," + fecha_nacimiento + ",'" + idUsuario + "')");
    
    if (num1 == 1 && num2 == 1) {
        out.println("<script>location.href='/home/home.jsp';</script>");
    } else {
        out.println("<script>location.href='/index.jsp';</script>");
    }
} catch (Exception e) {
    out.println(e.toString());
}


%>

