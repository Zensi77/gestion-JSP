<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>

        
<%
    String mail = request.getParameter("mail");
    String password = request.getParameter("password");

    Connection con = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String envURL = System.getenv("JDBC_URL");
        String envUser = System.getenv("JDBC_USER");
        String envPass = System.getenv("JDBC_PASSWORD");
        con = DriverManager.getConnection(envURL, envUser, envPass);
        
        String sql = "SELECT * FROM usuarios WHERE mail = ? AND password = ?";
        stmt = con.prepareStatement(sql);
        stmt.setString(1, mail);
        stmt.setString(2, password);

        rs = stmt.executeQuery();

        if (rs.next()) {
            response.sendRedirect("home/home.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
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
