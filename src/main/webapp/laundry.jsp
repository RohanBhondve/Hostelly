<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Laundry</title>
    <link rel="stylesheet" href = "laundry.css">
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
                <h1 class="welcome">Laundry</h1>
                <a href="homepage2.jsp">
                	<img class="logo" src="images/mainlogo1.jpg">
                </a>
            </div>
            <div class="service-container">
                <img src="images/laundry.png" alt="Washing Machine" class="washing-machine">
                <div class="service-form">
                    <h2>Schedule a Service</h2>
                    <form action="laundryServlet" method="post">
                        <div class="form-group">
                            <label for="room">Room No:</label>
                            <input type="text" id="room" name="roomNo" required>
                        </div>
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="clothes">Number of Clothes:</label>
                            <input type="number" id="clothes" name="clothes" required>
                        </div>
                         <div class="form-group">
                            <label for="date">Date:</label>
                            <input type="date" id="date" name="date" required>
                        </div>
                        <div class="form-group">
                            <label for="time">Pickup Time:</label>
                            <input type="time" id="time" name="time" required>
                        </div>
                        <button type="submit" class="pay-button">Pay</button>
                    </form>
                </div>
            </div>
        </div>
    </main>
</body>
</html>