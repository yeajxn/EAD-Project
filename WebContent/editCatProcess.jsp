<%
	HttpSession Session = request.getSession(false);
	if (Session != null) {
		Boolean admin = (Boolean) Session.getAttribute("status");
		if (admin == null){
			response.sendRedirect("index.jsp");
		}
		else if (admin != true) {
			response.sendRedirect("index.jsp");
		}
	} else
		response.sendRedirect("index.jsp");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
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

			String id = request.getParameter("newID");
			String idInitial = request.getParameter("hidID");
			String name = request.getParameter("name");
			String descr = request.getParameter("descr");
			String sql = "update categories set CategoryID =  ?, CategoryName = ?, CategoryDescription = ? where CategoryID = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, descr);
			pstmt.setString(4, idInitial);

			int check = pstmt.executeUpdate();
			if (check == 0) {
				conn.close();
				response.sendRedirect("editCat.jsp?hiddenCat=" + id
						+ "&cnfm=n&msg=Update Failed.");
			} else {
				conn.close();
				response.sendRedirect("editCat.jsp?hiddenCat=" + id
						+ "&cnfm=y&msg=Update Succcesful!");
			}

		}

		catch (Exception e) {
			out.println(e);
		}
	%>
</body>
</html>