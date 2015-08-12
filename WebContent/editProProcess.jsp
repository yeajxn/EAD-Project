
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

			String cid = request.getParameter("cid");
			String pid = request.getParameter("pid");
			String pidInitial = request.getParameter("hidPIDinitial");
			String cname = request.getParameter("hidName");
			String brand = request.getParameter("brand");
			int quantity = Integer.parseInt(request
					.getParameter("quantity"));
			String specs = request.getParameter("specs");
			String descr = request.getParameter("descr");
			Double price = Double
					.parseDouble(request.getParameter("price"));
			String img = request.getParameter("img");
			String imgInitial = request.getParameter("hidImg");
			if (img == null) {
				img = imgInitial;
			} else {
				img = "img/products/" + cname + "/" + img;
			}

			String sql = "update products set ProductID = ?, Brand = ?, Quantity = ?, Description = ?, Specifications = ?, Price = ?, Image = ? where ProductID = ? and CategoryID = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pid);
			pstmt.setString(2, brand);
			pstmt.setInt(3, quantity);
			pstmt.setString(4, descr);
			pstmt.setString(5, specs);
			pstmt.setDouble(6, price);
			pstmt.setString(7, img);
			pstmt.setString(8, pidInitial);
			pstmt.setString(9, cid);

			int check = pstmt.executeUpdate();

			if (check == 0) {
				response.sendRedirect("editPro.jsp?msg=Failed to update, please check that you have not entered incorrect values&cnfm=n&hidCat="
						+ cid + "&hidPro=" + pid + "&hidName=" + cname);
			} else {
				response.sendRedirect("editPro.jsp?msg=Update Succesful&cnfm=y&hidCat="
						+ cid + "&hidPro=" + pid + "&hidName=" + cname);
			}

			conn.close();
		}

		catch (Exception e) {
			out.println(e);
		}
	%>
</body>
</html>