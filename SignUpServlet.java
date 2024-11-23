import java.io.*;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.sql.*;

public class SignUpServlet extends HttpServlet{
    protected void doPost(HttpRequest request, HttpResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = "Employee";

        try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/access_management", "user", "password")) {
            String query = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            pstmt.setString(3, role);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("login.jsp");
    }
}