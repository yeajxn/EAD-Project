
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
<%@page import="java.sql.*" import="java.util.List"
	import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>SP IT! | Products</title>
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

	<%
		try {
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/ead project?user=root&password=root";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			String filterSelect = request.getParameter("filterSelect");
			if (filterSelect == null) {
				filterSelect = "All";
			}

			String sqlCatName = "select * from categories";
			PreparedStatement pCatName = conn.prepareStatement(sqlCatName);

			int noCats = 0;
			List<String> cat = new ArrayList<String>();
			List<String> listId = new ArrayList<String>();

			ResultSet rsGetCat = pCatName.executeQuery();
			while (rsGetCat.next()) {
				cat.add(rsGetCat.getString("CategoryName"));
				listId.add(rsGetCat.getString("CategoryID"));
				noCats++;
			}
	%>
	<div class="clear">
		<div class="row">
			<div class="container">
				<h1>Products</h1>
				<div class="dropdown">
					<button class="btn btn-default dropdown-toggle col-xs-2"
						type="button" id="filterMenu" data-toggle="dropdown"
						aria-expanded="true">
						Select Categories<span class="caret"></span>
					</button>

					<ul class="dropdown-menu " role="menu" aria-labelledby="filterMenu">
						<li role="presentation"><a
							href="filterSet.jsp?source=adminPro">All</a></li>
						<%
							for (int j = 0; j < noCats; j++) {
									out.println("<li role = 'presentation'><a href = filterSet.jsp?source=adminPro&filterSelect="
											+ listId.get(j)
											+ ">"
											+ listId.get(j)
											+ " - "
											+ cat.get(j) + "</a></li>");
								}
						%>
					</ul>
				</div>

				<form action="addPro.jsp">
					<input class="btn btn-success col-xs-2" type="submit"
						value="Add New Products">
				</form>
				<form action="delProMulti.jsp">
					<input class="btn btn-danger col-xs-2" type="submit"
						value="Delete Multiple Products">
				</form>
			</div>
		</div>
	</div>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="col-md-1">Category Info</th>
					<th class="col-md-1">Product ID</th>
					<th class="col-md-1">Brand</th>
					<th class="col-md-1">Quantity</th>
					<th class="col-md-2">Description</th>
					<th class="col-md-1">Specifications</th>
					<th class="col-md-1">Price</th>
					<th class="col-md-1">Image Link</th>
					<th class="col-md-1"></th>
					<th class="col-md-1"></th>
				</tr>
			</thead>
			<tbody>
				<%
					String sql = "";
						if (filterSelect.equals("All")) {
							sql = "SELECT c.CategoryName  ,p.* from products p, categories c where p.CategoryID=c.CategoryID";
						} else {
							sql = "SELECT c.CategoryName  ,p.* from products p, categories c where c.CategoryName = ? and p.CategoryID=c.CategoryID";
						}
						PreparedStatement pstmt = conn.prepareStatement(sql);
						if (!filterSelect.equals("All")) {
							pstmt.setString(1, filterSelect);
						}
						ResultSet rs = pstmt.executeQuery();

						while (rs.next()) {
							String catId = rs.getString("CategoryID");
							String catName = rs.getString("CategoryName");
							String proId = rs.getString("ProductID");
							String brand = rs.getString("Brand");
							int quantity = Integer.parseInt(rs.getString("Quantity"));
							String descr = rs.getString("Description");
							String specs = rs.getString("Specifications");
							Double price = rs.getDouble("Price");
							String img = rs.getString("Image");
							out.println("<tr><td>"
									+ catId
									+ " "
									+ catName
									+ "</td><td>"
									+ proId
									+ "</td><td>"
									+ brand
									+ "</td><td>"
									+ quantity
									+ "</td><td>"
									+ descr
									+ "</td><td>"
									+ specs
									+ "</td><td>"
									+ price
									+ "</td><td>"
									+ img
									+ "<td><form action = 'deletePro.jsp' method = 'post'><input type = 'submit' class = 'btn btn-danger' value = 'Delete'>"
									+ "<input type = 'hidden' value = '"
									+ catId
									+ "' name = 'hidCat'>"
									+ "<input type = 'hidden' value ='"
									+ proId
									+ "' name = 'hidPro'>"
									+ "<input type = 'hidden' value = '"
									+ catName
									+ "' name = 'hidName'>"
									+ "</form></td>"
									+ "<td><form action = 'editPro.jsp' method = 'post'><input type = 'submit' class = 'btn btn-info' value = 'Edit'>"
									+ "<input type = 'hidden' value = '" + catId
									+ "' name = 'hidCat'>"
									+ "<input type = 'hidden' value = '" + proId
									+ "' name = 'hidPro'>"
									+ "<input type = 'hidden' value = '" + catName
									+ "' name = 'hidName'>" + "</form></td></tr>");

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