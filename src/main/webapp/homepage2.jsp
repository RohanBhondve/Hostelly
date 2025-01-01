<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="com.Hostelly.dao.userDaoImp" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    <link rel="stylesheet" href="homepage.css"/>
    
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

        <!-- Content area where the profile info is displayed -->
        <% HttpSession session1 = request.getSession(false);
        String name="";
        
		if (session1 != null && session1.getAttribute("username") != null) {
            name = (String) session1.getAttribute("username");
			}
		userDaoImp ud2 = new userDaoImp();
		ArrayList<String> list = ud2.getDetails(name);
		String id = list.get(0);
		String room = list.get(1);
		String course = list.get(2);
		String year = list.get(3);
	
		
		
		%>
        <div class="content-area">
            <div class="header">
                <h1 class="welcome">Welcome <%=name %>!</h1>
                <a href="homepage.jsp">
                	<img class="logo" src="images/mainlogo1.jpg">
                </a>
                
            </div>

       
	   <img src="images/profile-user.png" class="profile-picture">
	   

            <div class="profile-section">
                <!-- Student Information on the left -->
                <div  class="student-info">
                    <h2>Student Information</h2>
                    <p>ID: <%=id%></p>
                    <p>Room: <%=room%></p>
                    <p>Course: <%=course%></p>
                    <p>Year: <%=year%></p>
                    <form action="homeServlet2" method="post">
                    	<input type="hidden" name="id" value="<%=id %>">
   						<input type="hidden" id="statusInput" name="status" value="">
   						<input type="hidden" id="locationInput" name="getLocation" value="">
                    	<button type="button" class="check-in-btn" onclick="toggleButtonText(this)">Check Out</button>
                    </form>
                    
                    
                </div>

                <!-- History Section on the right -->
                <div class="history">
                    <h2>History</h2>
                    <ul>
                        <li>Laundry - Completed on 2024-10-15</li>
                        <li>Housekeeping - Completed on 2024-10-12</li>
                        
                    </ul>
                    
                </div>
            </div>
        </div>
    </main>
    <script>
    
    function toggleButtonText(button) {
    	
    	const statusInput = document.getElementById("statusInput");
        statusInput.value = button.innerText;
        
      //for location
        const locationInput = document.getElementById("locationInput");
        
        const getLocation = () => {
        	  if (navigator.geolocation) {
        	    navigator.geolocation.getCurrentPosition(
        	      (position) => {
        	        const latitude = position.coords.latitude;
        	        const longitude = position.coords.longitude; 
        	        locationInput.value = latitude+","+longitude;;
        	        
        	        button.closest("form").submit();
        	        
        	      },
        	      (error) => {
        	        console.error("Error getting location:", error.message);
        	      }
        	    );
        	  } else {
        	    alert("Geolocation not supported by this browser.");
        	  }
        	};
        getLocation();
        
    }
    
    
</script>
</body>

</html>