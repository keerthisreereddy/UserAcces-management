<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h1>Login</h1>
    <form action="LoginServlet" method="POST">
        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password" required><br><br>
        
        <button type="submit">Login</button>
    </form>
    <br>
    <p>Don't have an account? <a href="signup.jsp">Sign up here</a></p>
    <%
        String error = request.getParameter("error");
        if (error != null && error.equals("invalid")) {
            out.println("<p style='color:red;'>Invalid username or password. Please try again.</p>");
        }
    %>
</body>
</html>