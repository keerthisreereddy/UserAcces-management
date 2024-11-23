<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
</head>
<body>
    <h1>Sign Up</h1>
    <form action="SignUpServlet" method="POST">
        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password" required><br><br>
        
        <!-- Role is defaulted to "Employee" in the servlet -->
        <input type="hidden" name="role" value="Employee">
        
        <button type="submit">Sign Up</button>
    </form>
    <br>
    <p>Already have an account? <a href="login.jsp">Login here</a></p>
</body>
</html