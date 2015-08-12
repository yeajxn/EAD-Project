
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
<title>SP IT! | Edit Products</title>
</head>
<body>
		<jsp:include page="adminNav.jsp"></jsp:include>

	<%
		String brand = "";
		int quantity = 0;
		String descr = "";
		String specs = "";
		Double price = 0.0;
		String img = "";
		String imgDefault = "";
		String cnfm = "";
		try {
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/ead project?user=root&password=root";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			String pid = request.getParameter("hidPro");
			String cid = request.getParameter("hidCat");
			String cName = ""; // = request.getParameter("hidName");
			cnfm = request.getParameter("cnfm");
			String sql = "select c.CategoryName , p.* from products p, categories c where p.ProductID = ? and p.CategoryID = ? and p.CategoryID = c.CategoryID";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pid);
			pstmt.setString(2, cid);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				brand = rs.getString("Brand");
				cName = rs.getString("CategoryName");
				quantity = Integer.parseInt(rs.getString("quantity"));
				descr = rs.getString("Description");
				specs = rs.getString("Specifications");
				price = rs.getDouble("Price");
				img = rs.getString("Image");
			}
	%>
	<div class="clear">
		<div class="container">
			<div class="row">
				<h3>
					Edit Product:
					<%=brand%>
					<%=pid%>
					(<%=cName%>)
				</h3>
			</div>
		</div>
		<%
			if (cnfm == null) {
					out.println("");
				} else {
					out.println("<div class = 'container'><div class='row'><kbd>"
							+ request.getParameter("msg")
							+ "</kbd></div></div>");
				}
		%>

		<div class="container">
			<form action="editProProcess.jsp" role="form" method="post"
				class="form-horizontal">
				<div class="form-group">
					<label for="CatID" class="col-md-2">Category ID: </label>
					<div class="col-md-10">
						<input type="text" class="form-control" value="<%=cid%>"
							id="CatID" name="cid" readonly required> <input
							type="hidden" name="hidName" value="<%=cName%>">
					</div>
				</div>
				<div class="form-group">
					<label for="ProID" class="col-md-2">Product ID: </label>
					<div class="col-md-10">
						<input type="text" maxlength="20" class="form-control"
							value="<%=pid%>" id="CatID" name="pid" placeholder="Product ID"
							required> <input type="hidden" value="<%=pid%>"
							name="hidPIDinitial">
					</div>
				</div>
				<div class="form-group">
					<label for="brand" class="col-md-2">Brand: </label>
					<div class="col-md-10">
						<input type="text" maxlength="40" class="form-control"
							value="<%=brand%>" id="brand" name="brand" placeholder="Brand"
							required>
					</div>
				</div>
				<div class="form-group">
					<label for="quantity" class="col-md-2">Quantity: </label>
					<div class="col-md-10">
						<input type="number" min="0" class="form-control"
							value="<%=quantity%>" id="quantity" name="quantity"
							placeholder="Quantity" required>
					</div>
				</div>
				<div class="form-group">
					<label for="specs" class="col-md-2">Specifications </label>
					<div class="col-md-10">
						<textarea class="form-control" rows="15" value="<%=specs%>"
							id="specs" name="specs" maxlength="800"
							placeholder="Specifications" required><%=specs%></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="descr" class="col-md-2">Description: </label>
					<div class="col-md-10">
						<textarea class="form-control" rows="4" value="<%=descr%>"
							id="descr" name="descr" maxlength="300" placeholder="Description"
							required><%=descr%></textarea>
					</div>
				</div>
				<div class="form-group">
					<label for="price" class="col-md-2">Price: </label>
					<div class="col-md-10">
						<input type="number" min="0" max="99999.99" step="0.01"
							class="form-control" value="<%=price%>" id="price" name="price"
							placeholder="Price" required>
					</div>
				</div>
				<div class="form-group">
					<label for="img" class="col-md-2">Image: </label>
					<div class="col-md-2">
						<input type="file" id="img" name="img">
						<p class="help-block">
							Current location:
							<%=img%></p>
						<input type="hidden" value="<%=img%>" name="hidImg">
					</div>
				</div>
				<div class="row">
					<%
						if (cnfm == null) {
								out.println("<input type = 'submit' class = 'btn btn-default' value = 'Confirm'>");
							} else if (cnfm.equals("y")) {
								out.println("<input type = 'submit' class = 'btn btn-success' value = 'Confirm'>");
							} else if (cnfm.equals("n")) {
								out.println("<input type = 'submit' class = 'btn btn-danger' value = 'Confirm'>");
							}
					%>

					<input type="reset" class="btn btn-warning" value="Reset">
					<a href="adminPro.jsp"><button type="button"
							class="btn btn-info">Back</button></a>
				</div>
				<br> <br>
			</form>
		</div>
	</div>



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