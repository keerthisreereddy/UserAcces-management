<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pending Requests</title>
</head>
<body>
    <h1>Pending Access Requests</h1>
    <form action="ApprovalServlet" method="POST">
        <table border="1">
            <tr>
                <th>Employee Name</th>
                <th>Software</th>
                <th>Access Type</th>
                <th>Reason</th>
                <th>Action</th>
            </tr>
            <%
                try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/access_management", "user", "password")) {
                    String query = "SELECT r.id, u.username, s.name AS software, r.access_type, r.reason FROM requests r " +
                                   "JOIN users u ON r.user_id = u.id " +
                                   "JOIN software s ON r.software_id = s.id " +
                                   "WHERE r.status = 'Pending'";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("username") + "</td>");
                        out.println("<td>" + rs.getString("software") + "</td>");
                        out.println("<td>" + rs.getString("access_type") + "</td>");
                        out.println("<td>" + rs.getString("reason") + "</td>");
                        out.println("<td>");
                        out.println("<button type='submit' name='action' value='approve-" + rs.getInt("id") + "'>Approve</button>");
                        out.println("<button type='submit' name='action' value='reject-" + rs.getInt("id") + "'>Reject</button>");
                        out.println("</td>");
                        out.println("</tr>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </form>
</body>
</html>