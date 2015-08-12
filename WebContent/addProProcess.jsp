
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
			String cname = "";
			String pid = request.getParameter("pid");
			String brand = request.getParameter("brand");
			String descr = request.getParameter("descr");
			String specs = request.getParameter("specs");
			String img = request.getParameter("img");
			String x1 = "Select CategoryName from categories where CategoryID = ?";
			PreparedStatement x2 = conn.prepareStatement(x1);
			x2.setString(1, cid);
			ResultSet x3 = x2.executeQuery();
			while (x3.next()) {
				cname = x3.getString("CategoryName");
			}
			if (img == null) {
				img = "img/products/" + cname + "/" + cname + ".png";
			} else {
				img = "img/products/" + cname + "/" + img;
			}

			int quantity = Integer.parseInt(request
					.getParameter("quantity"));
			Double price = Double
					.parseDouble(request.getParameter("price"));

			String sql = "insert into products (CategoryID, ProductID, brand, Description, Specifications, Quantity, Price, Image) values (?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			pstmt.setString(2, pid);
			pstmt.setString(3, brand);
			pstmt.setString(4, descr);
			pstmt.setString(5, specs);
			pstmt.setInt(6, quantity);
			pstmt.setDouble(7, price);
			pstmt.setString(8, img);

			int check = pstmt.executeUpdate();

			if (check == 0) {
				response.sendRedirect("addPro.jsp?cnfm=n&msg=Failed to add new product");
			} else {
				response.sendRedirect("editPro.jsp?cnfm=y&msg=New product added!&hidPro="
						+ pid + "&hidCat=" + cid);
			}

			conn.close();
		} catch (Exception e) {
			out.println(e);
		}
	%>
</body>
</html>