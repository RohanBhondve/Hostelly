<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hostelly</title>
    <link rel="stylesheet" href="login.css"/>
</head>

<body>
    <img class="logo" src="images/mainlogo1.jpg" >
    
    <div class="container">
        <div class="illustration">
            <img src="images/hostellyLogin.jpg" alt="Hostel illustration showing bunk beds and people">
        </div>
        
        <div class="login-section">
            <h1>Welcome to Hostelly</h1>
            <form action="loginServlet" method="Post">
                <input type="text" class="username" placeholder="College ID" name="username" required>
                <input type="password" class="password" placeholder="Password" name="password" required>
                <button class="btn">Login</button>
                <a href="#" class="forgot-password">Forgot Password?</a>
            </form>
            
            <%String error = request.getParameter("error");
            if(error != null && error.equals("1")){%>
            	<p style="color:red; text-align:center; margin-top:5px;">Invalid ID or Password</p>
            <% }%>
            
        </div>
    </div>
    
    
</body>
</html>