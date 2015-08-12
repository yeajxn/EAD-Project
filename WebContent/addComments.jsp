<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "java.sql.*" import = "java.text.SimpleDateFormat" import = "java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
	// Step1: Load JDBC Driver
	Class.forName("com.mysql.jdbc.Driver");

	// Step 2: Define Connection URL
	String connURL = "jdbc:mysql://localhost/ead project?user=root&password=root";

	// Step 3: Establish connection to URL
	Connection conn = DriverManager.getConnection(connURL);

	String pid = request.getParameter("hidpid");
	String cid = request.getParameter("hidcid");
	String author = request.getParameter("author");
	String comment = request.getParameter("comment");
	String rating = request.getParameter("rating");
	Date today = new Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	String date = format.format(today);
	
	String sql = "insert into comments (CategoryID, ProductID, Rating, Comment, Author, Date )values(?,?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,cid);
	pstmt.setString(2,pid);
	pstmt.setString(3,rating);
	pstmt.setString(4,comment);
	pstmt.setString(5,author);
	pstmt.setString(6,date);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("comments.jsp?cid="+cid+"&pid="+pid);
	
	
	conn.close();
	} catch (Exception e) {
		out.println(e);
	}
%>

</body>
</html>