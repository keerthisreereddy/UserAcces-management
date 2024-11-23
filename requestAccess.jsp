<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Request Access</title>
</head>
<body>
    <h1>Request Software Access</h1>
    <form action="RequestServlet" method="POST">
        <label for="software">Software:</label><br>
        <select id="software" name="softwareId" required>
            <%
                try (Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/access_management", "user", "password")) {
                    String query = "SELECT id, name FROM software";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    while (rs.next()) {
                        out.println("<option value='" + rs.getInt("id") + "'>" + rs.getString("name") + "</option>");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </select><br><br>

        <label for="accessType">Access Type:</label><br>
        <select id="accessType" name="accessType" required>
            <option value="Read">Read</option>
            <option value="Write">Write</option>
            <option value="Admin">Admin</option>
        </select><br><br>
        
        <label for="reason">Reason for Request:</label><br>
        <textarea id="reason" name="reason" rows="4" cols="50" required></textarea><br><br>
        
        <button type="submit">Submit Request</button>
    </form>
</body>
</html>