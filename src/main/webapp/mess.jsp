<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mess</title>
    <link rel="stylesheet" href="mess.css">
</head>
<body>
    <main class="main-content">
        <!-- Sidebar inside main-content -->
        <nav class="sidebar">
            <h1>Student Portal</h1>
            <ul class="nav-items">
                <li><a href="laundry.jsp">Laundry</a></li>
                <li><a href="housekeeping.jsp">Housekeeping</a></li>
                <li><a href="mess.jsp">Mess</a></li>
                <li><a href="#complaints">Complaints</a></li>
                <li><a href="#fees">Pay Fees</a></li>
                <li><a href="login.jsp">Logout</a></li>
                
            </ul>
        </nav>
        <div class="content-area">
            <div class="header">
                <h1 class="welcome">Mess</h1>
                <a href="homepage2.jsp">
                	<img class="logo" src="images/mainlogo1.jpg">
                </a>
            </div>
            <div class="service-container">
                <img src="images/restaurant.png" alt="Mess" class="mess">
                <div class="service-form">
                 
		    <h2>Breakfast</h2>
		    <h3>Poori and Aloo Curry, Aloo Paratha with Yogurt, Bread Butter Jam.</h3>

		    <h2>Lunch</h2>
		    <h3>Roti, Dal, Mixed Vegetable Curry, Jeera Rice, Raita.</h3>

                    <h2>Dinner</h2>
		    <h3>Vegetarian: Roti, Dal Makhani, Palak Paneer, Jeera Rice, Raita.<br>
                        Non-Vegetarian: Roti, Chicken Curry, Vegetable Curry, Jeera Rice, Raita.</h3>

		</div>
		    
            </div>
        </div>
    </main>
</body>
</html>