package registro;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String fecha_nacimiento = request.getParameter("anio_nacimiento");
        String ciudad = request.getParameter("ciudad");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/peliculas", "user",
                    "user");
            Statement statement = connection.createStatement();

            String insertPersona = "INSERT INTO persona (nombre, apellido, anio_nacimiento, ciudad) VALUES (?, ?, ?, ?)";
            String idPersona = "SELECT count(*) FROM persona";
            String insertUsuario = "INSERT INTO usuario (id_persona, email, password) VALUES (?, ?, ?)";

            PreparedStatement stmt = connection.prepareStatement(insertPersona);
            stmt.setString(1, nombre);
            stmt.setString(2, apellido);
            stmt.setString(3, fecha_nacimiento);
            stmt.setString(4, ciudad);
            stmt.executeUpdate();

            ResultSet rs = statement.executeQuery(idPersona);
            int id = 0;
            if (rs.next()) {
                id = rs.getInt(1);
            }

            stmt = connection.prepareStatement(insertUsuario);
            stmt.setInt(1, id);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.executeUpdate();

            if (id > 0) {
                response.sendRedirect("home/home.jsp?nombre=" + nombre + "&apellido=" + apellido);
            } else {

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
