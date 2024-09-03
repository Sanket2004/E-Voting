<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
    String selectedPerson = request.getParameter("selectedPerson");
    String userId = request.getParameter("username");

    // Update the 'vote' column in the 'votes' table
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb", "root", "12345678");

        // Assuming you have a table named 'votes' with columns 'vote' and 'id'
        String query = "UPDATE e_voting SET vote = ? WHERE id = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, selectedPerson);
        ps.setString(2, userId);
        System.out.println(userId);
        System.out.println(selectedPerson);

        ps.executeUpdate();

        // Close resources
        ps.close();
        con.close();
        response.sendRedirect("thanks.jsp");
    } catch (Exception e) {
        e.printStackTrace();
        // Handle exceptions appropriately
    }
%>
