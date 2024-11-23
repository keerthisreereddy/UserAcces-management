import java.io.*;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;


import java.sql.*;

public class SoftwareServlet extends HttpServlet {
    protected void doPost(HttpRequest request, HttpResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String accessLevels = request.getParameter("accessLevels");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/access_management", "user", "password")) {
            String query = "INSERT INTO software (name, description, access_levels) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, description);
            pstmt.setString(3, accessLevels);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("createSoftware.jsp?success=true");
    }
}