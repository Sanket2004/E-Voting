<%@ page import="java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>

<%
	String id="", pwd="";
	HttpSession ss = request.getSession();
	Object user = ss.getAttribute("user");
	if(user!=null)
	{
    String idToDelete = request.getParameter("id");
    Connection con = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb", "root", "12345678");

        // Assuming your table is named 'your_table_name'
        String query = "UPDATE e_voting SET vote = NULL WHERE id = ?";
        ps = con.prepareStatement(query);
        ps.setString(1, idToDelete);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close resources in the reverse order of their creation
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    response.sendRedirect("dashboard.jsp");
	}else{
		response.sendRedirect("loginPage.jsp");
	}
%>
