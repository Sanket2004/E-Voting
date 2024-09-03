<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard | E-Voting</title>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="dashboard.css">
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
		}
		else{
			response.sendRedirect("loginPage.jsp");
		}
%>
<div class="navbar">
	<div class="left" onclick="toggle()">
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

    <div class="main">
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb", "root", "12345678");
            PreparedStatement ps1 = con.prepareStatement("SELECT vote FROM e_voting WHERE id = ?;");
            ps1.setString(1, username);
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next())
			{
                String vote = rs1.getString("vote");
                if (vote == null)
				{
        %>
                    <form action="addVote.jsp" method="post">
                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            PreparedStatement ps = con.prepareStatement("SELECT * FROM candidates");
                            ResultSet rs = ps.executeQuery();
                            int exp;
                            String name = "";
                            while (rs.next())
							{
                                name = rs.getString(1);
                                exp = rs.getInt(2);
                        %>
	
							<div class="person">
								<img src="placeholder.jpg">
								<h1><%=name %></h1>
								<p><i class='bx bx-briefcase'></i> Experience: <%=exp %>yrs</p>
								<input type="radio" name="<%=name %>" id="<%=name %>" value="<%=name %>" onclick="selectperson('<%=name%>')">
		
							</div>
	
							<%
                            }
                        %>
                        <input type="hidden" name="selectedPerson" id="selectedPersonInput" value="">
                        <input type="hidden" name="username" value="<%=username %>">
                        <div id="selectedPerson">Select Your Vote</div>
                        <input type="submit" value="Submit">
                    </form>
                    <%
                } else {
                	    try {
                	        String queryfetch = "SELECT * FROM e_voting WHERE id = ?";
                	        PreparedStatement ps2 = con.prepareStatement(queryfetch);
                	        ps2.setString(1, username);
                	        ResultSet rs2 = ps2.executeQuery();

                	        if (rs2.next()) {
                	            String voted = rs2.getString("vote");
                	            String name = rs2.getString("name");
                	            String queryvote = "SELECT * FROM candidates WHERE name = ?";
                    	        PreparedStatement ps3 = con.prepareStatement(queryvote);
                    	        ps3.setString(1, voted);
                    	        ResultSet rs3 = ps3.executeQuery();
                    	        if (rs3.next()) {
                    	        	int exp = rs3.getInt(2);
								%>
								
									<div class="details" id="profile">
										<img src="placeholder.jpg">
										<div>
											<h1><%=vote %></h1>
											<h1 style="font-size:13px; font-style:italic; font-weight:500;">Experience: <%=exp %> yrs</h1>
										</div>
										<a href="deleteVote.jsp?id=<%=username%>"><i class='bx bx-trash'></i></a>
										
										
									</div>
								
								<%
                    	        }
                	        } else {
                	            out.println("No record found for ID: " + username);
                	        }
                	    } catch (Exception e) {
                	        e.printStackTrace();
                	    }
                	%>
                    <h1 class="voted" id="voted">Your have already voted!</h1>
                    <%
                }
            }
            %>
</div>

<script>
var person = "";
const person_container = document.getElementById("selectedPerson");
const hiddenInput = document.getElementById("selectedPersonInput");

function selectperson(name) {
    const response = confirm("Are you sure to vote " + name + " ?");
    if (response === true) {
    	var allRadioButtons = document.querySelectorAll('input[type="radio"]');
    	allRadioButtons.forEach(function(radioButton) {
    	    radioButton.checked = false;
    	});

    	// Check the currently clicked radio button
    	var currRadio = document.querySelector('input[type="radio"][name="' + name + '"]');
    	if (currRadio) {
    	    currRadio.checked = true;
    	}


        if (person === name) {
            alert(name + ' is already selected !!');
        } else {
            person = name;
            console.log(name);
            person_container.innerHTML = "Selected Person: " + person;

            // Set the value of the hidden input field
            hiddenInput.value = person;
        }
    }else{
    	var allRadioButtons = document.querySelectorAll('input[type="radio"]');
    	allRadioButtons.forEach(function(radioButton) {
    	    radioButton.checked = false;
    	});
    }
    return person;
}


</script>

</body>
</html>