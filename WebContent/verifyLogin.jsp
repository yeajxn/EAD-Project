<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import = "java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<%
	try{		
		// Step1: Load JDBC Driver
	    Class.forName("com.mysql.jdbc.Driver");

	    // Step 2: Define Connection URL
	    String connURL ="jdbc:mysql://localhost/ead project?user=root&password=root"; 

	    // Step 3: Establish connection to URL
	    Connection conn = DriverManager.getConnection(connURL);
	
	
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		String sql = "Select * from login where email=? and password=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,email);
		pstmt.setString(2,password);
		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()){
			response.sendRedirect("adminHome.jsp");
		}
		else {
			response.sendRedirect("login.jsp?msg=Invalid ID/Password");
			}
		conn.close();
	}
	catch (Exception e){
		out.println(e);
	}
	%>
</body>
</html>