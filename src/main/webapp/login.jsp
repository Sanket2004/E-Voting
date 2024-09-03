<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*"%>

<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb", "root", "12345678");
	String sql = "SELECT * FROM e_voting WHERE id=? and password=?;";
	
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setString(1, id);
	ps.setString(2, pass);
	
	ResultSet rs = ps.executeQuery();
	
	if(rs.next())
	{
		HttpSession ss = request.getSession();
		ss.setAttribute("user", id);
		
		Cookie userCookie = new Cookie("id", id);
		userCookie.setMaxAge(24*60*60);
		response.addCookie(userCookie);
		
		Cookie passwordCookie = new Cookie("password", pass);
		passwordCookie.setMaxAge(24*60*60);
		response.addCookie(passwordCookie);
		
		response.sendRedirect("dashboard.jsp");
		%>
		<script>
			alert("Login successfull !!");
		</script>
		<%
	}else{
			%>
			<script>
			alert("Login Failed !!");
	            window.location.href = "http://localhost:8080/E-Voting/loginPage.jsp";
		</script>
			<% 
	}
	
%>