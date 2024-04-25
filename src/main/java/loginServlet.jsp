<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

        
<%
    try {
        Thread.sleep(2000);
    } catch (InterruptedException e) {
        out.println(e.getMessage());
    }
    String mail = request.getParameter("mail");
    String contrasena = request.getParameter("password");


    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String envURL = System.getenv("JDBC_URL");
        String envUser = System.getenv("JDBC_USER");
        String envPass = System.getenv("JDBC_PASSWORD");

        con = DriverManager.getConnection(envURL, envUser, envPass);
        String sql = "SELECT * FROM usuario WHERE email = ? AND contrasena = ?";
        stmt = con.prepareStatement(sql);
        stmt.setString(1, mail);
        stmt.setString(2, contrasena);
        rs = stmt.executeQuery();

        if (rs.next()) {
            out.println("<script>location.href='/home/home.jsp';</script>");
        } else {
            out.println("<script>location.href='/index.jsp';</script>");
        }
    } catch (Exception e) {
        out.println(e.getMessage());
    } finally {
        // Cerrar recursos
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (stmt != null) {
            try {
                stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
%>

