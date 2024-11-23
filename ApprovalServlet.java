import java.io.*;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;


import java.sql.*;

public class ApprovalServlet extends HttpServlet {
    protected void doPost(HttpRequest request, HttpResponse response) throws ServletException, IOException {
        int requestId = Integer.parseInt(request.getParameter("requestId"));
        String action =  request.getParameter("action");

        try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/access_management", "user", "password")) {
            String query = "UPDATE requests SET status = ? WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, action.equals("approve") ? "Approved" : "Rejected");
            pstmt.setInt(2, requestId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("pendingRequests.jsp");
    }
}
 
