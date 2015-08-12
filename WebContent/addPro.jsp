
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
<title>SP IT! | Add Products</title>
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

			String sql = "select * from Categories";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			int count = 0;
			List<String> cid = new ArrayList<String>();
			List<String> name = new ArrayList<String>();
			while (rs.next()) {
				cid.add(count, rs.getString("CategoryID"));
				name.add(count, rs.getString("CategoryName"));
				count++;
			}
	%>
	<div class="clear">
		<div class="row">
			<div class="container">
				<h1>Add New Product</h1>
			</div>
		</div>
	</div>
	<div class="container">
		<form role="form" class="form-horizontal" action="addProProcess.jsp"
			method="post">
			<div class="form-group">
				<label class="col-md-2">Category: </label>
				<div class="col-md-10">
					<select class="form-control" name="cid">
						<%
							for (int i = 0; i < count; i++) {
									out.println("<option name = 'cid' value = '" + cid.get(i)
											+ "'>" + cid.get(i) + " - " + name.get(i)
											+ "</option>");
								}
						%>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2">Product ID*: </label>
				<div class="col-md-10">
					<input class="form-control" type="text" maxlength="20" name="pid"
						placeholder="Product ID" required>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2">Brand*: </label>
				<div class="col-md-10">
					<input class="form-control" type="text" maxlength="40" name="brand"
						placeholder="Brand" required>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2">Quantity*: </label>
				<div class="col-md-10">
					<input class="form-control" type="number" min="0" name="quantity"
						placeholder="Quantity">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2">Description*: </label>
				<div class="col-md-10">
					<textarea class="form-control" rows="4" name="descr"
						maxlength="300" placeholder="Description" required></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2">Specifications*: </label>
				<div class="col-md-10">
					<textarea class="form-control" rows="15" name="specs"
						maxlength="800" placeholder="Specifications" required></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2">Price*: </label>
				<div class="col-md-10">
					<input class="form-control" type="number" name="price" min="0"
						placeholder="Price" step="0.01" required>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2">Image: </label>
				<div class="col-md-10">
					<input type="file" name="img">
				</div>
			</div>
			<div class="row">
				<h5>* Required Fields</h5>
			</div>
			<div class="row">
				<%
					String cnfm = request.getParameter("cnfm");
						if (cnfm == null) {
							out.println("<input type = 'submit' class = 'btn btn-default' value = 'Confirm'>");
						} else if (cnfm.equals("n")) {
							out.println("<input type = 'submit' class = 'btn btn-danger' value = 'Confirm'>");
						}
				%>
				<input type="reset" value="Clear" class="btn btn-warning"> <a
					href="adminPro.jsp"><button type="button" class="btn btn-info">Back</button></a>
			</div>
		</form>
	</div>
	<br>
	<br>
	<br>
	<br>

	<%
		conn.close();
		} catch (Exception e) {
			out.println(e);
		}
	%>

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