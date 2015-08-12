
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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>SP IT! | Categories</title>
<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/freelancer.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<jsp:include page="adminNav.jsp"></jsp:include>

	<div class="clear">
		<div class="row">
			<div class="container">
				<h1>Categories</h1>
				<form action="addCat.jsp">
					<input class="btn btn-success" type="submit"
						value="Add New Categories">
				</form>
			</div>
		</div>
	</div>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="col-md-1">Category ID</th>
					<th class="col-md-1">Category Name</th>
					<th class="col-md-7">Category Description</th>
					<th class="col-md-1">Number of products</th>
					<th class="col-md-1"></th>
					<th class="col-md-1"></th>
				</tr>
			</thead>
			<tbody>
				<%
					try {
						// Step1: Load JDBC Driver
						Class.forName("com.mysql.jdbc.Driver");

						// Step 2: Define Connection URL
						String connURL = "jdbc:mysql://localhost/ead project?user=root&password=root";

						// Step 3: Establish connection to URL
						Connection conn = DriverManager.getConnection(connURL);

						String sql = "select * from categories";
						String sql2 = "";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();

						while (rs.next()) {
							String id = rs.getString("categoryID");
							String name = rs.getString("categoryName");
							String descr = rs.getString("CategoryDescription");
							sql2 = "select * from products where CategoryID = ?";
							PreparedStatement pstmtCOUNT = conn.prepareStatement(sql2);
							pstmtCOUNT.setString(1, id);
							ResultSet rs2 = pstmtCOUNT.executeQuery();
							int count = 0;
							while (rs2.next()) {
								count++;
							}
							out.println("<tr><td>"
									+ id
									+ "</td><td>"
									+ name
									+ "</td>"
									+ "<td>"
									+ descr
									+ "</td><td>"
									+ count
									+ "</td><td><form action = 'deleteCat.jsp'><input type = 'submit' class = 'btn btn-danger' value = 'Delete'>"
									+ "<input type = 'hidden' value = "
									+ id
									+ " name = 'hiddenCat'></form></td>"
									+ "<td><form action = 'editCat.jsp'><input type = 'submit' class = 'btn btn-info' value = 'Edit'>"
									+ "<input type = 'hidden' value = " + id
									+ " name = 'hiddenCat'></form></td></tr>");
						}
						conn.close();
					} catch (Exception e) {
						out.println(e);
					}
				%>
			</tbody>
		</table>
	</div>



	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="js/classie.js"></script>
	<script src="js/cbpAnimatedHeader.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/freelancer.js"></script>
</body>
</html>