<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>E-Voting | Vote Your CEO</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" integrity="sha384-4LISF5TTJX/fLmGSxO53rV4miRxdg84mZsxmO8Rx5jGtp/LbrixFETvWa5a6sESd" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body>
<%
	String id="", pwd="";
	HttpSession ss = request.getSession();
	Object user = ss.getAttribute("user");
	if(user!=null)
	{
		response.sendRedirect("dashboard.jsp");
	}
%>
<div class="navbar">
	<div class="left">
		<img src="https://img.icons8.com/color/480/microsoft.png" alt="microsoft"/>
		<h1>E-Voting</h1>
	</div>
</div>
<div class="main">
	<div class="left__conatiner">
	<img class="hero" src="https://img.freepik.com/free-vector/man-having-online-job-interview_52683-43379.jpg">
	</div>
	<div class="login__container">
		<h1>E-Voting</h1>
		<h3>Choose Your Next CEO...</h3>
		<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>	
    	<a href="loginPage.jsp"><button >Login</button></a>
    </div>
</div>
</body>
</html>