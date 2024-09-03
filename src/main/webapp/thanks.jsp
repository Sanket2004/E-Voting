<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thanks For Your Voting | E-Voting</title>
<link rel="stylesheet" href="thanks.css">
</head>
<body>
<%@ page import= "java.sql.*"%>
<%
		HttpSession ss = request.getSession();
		Object user = ss.getAttribute("user");
		String username = "";
		if(user!=null)
		{
			username = user.toString();
		}else{
			response.sendRedirect("login.jsp");
		}
%>
<div class="navbar">
	<div class="left">
	<img src="https://img.icons8.com/color/480/microsoft.png" alt="microsoft"/>
		<img src="https://img.icons8.com/3d-fluency/94/user-male-circle.png" alt=""/>
		<div class="name">
			<h1>Hello</h1>
			<h3><%=username %></h3>
		</div>
	</div>
	<div class="right">
		<a href="logout.jsp">Logout</a>
	</div>
</div>
	<h1 class="main">Thanks for your voting.</h1>
	<script>
        setTimeout(function() {
            window.location.href = "http://localhost:8080/E-Voting/dashboard.jsp";
        }, 3000); // 3000 milliseconds (3 seconds) delay
    </script>
</body>
</html>