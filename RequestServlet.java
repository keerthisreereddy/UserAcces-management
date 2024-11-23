import java.io.*;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;


import java.sql.*;

public class RequestServlet extends HttpServlet {
    protected void doPost(HttpRequest request, HttpResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getSession().getAttribute("userId").toString());
        int softwareId = Integer.parseInt(request.getParameter("softwareId"));
        String accessType = request.getParameter("accessType");
        String reason = request.getParameter("reason");

        try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/access_management", "user", "password")) {
            String query = "INSERT INTO requests (user_id, software_id, access_type, reason, status) VALUES (?, ?, ?, ?, 'Pending')";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userId);
            pstmt.setInt(2, softwareId);
            pstmt.setString(3, accessType);
            pstmt.setString(4, reason);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("requestAccess.jsp?success=true");
    }
}
