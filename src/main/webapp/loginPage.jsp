<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login | E-Voting</title>
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
	}else{
		Cookie cookies[] = request.getCookies();
		for(int i=0; i< cookies.length; i++)
		{
			if(cookies[i].getName().equals("id"))
			{
				id = cookies[i].getValue();
			}
			if(cookies[i].getName().equals("password"))
			{
				pwd = cookies[i].getValue();
			}
		}
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
		<h1>Login</h1>
		<h3>Board Members</h3>
		<form action="login.jsp" method="post">
		<div class="field">
		<label>Microsoft ID</label>
			<input type="text" name="id" required>
		</div>
		<div class="field">
		<label>Password</label>
			<input type="password" name="pass" required>
		</div>
		<input type="submit" value="Login">
		</form>
    </div>
</div>
</body>
</html>