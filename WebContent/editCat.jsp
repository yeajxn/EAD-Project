
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
<title>SP IT! | Edit Categories</title>
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-inverse navbar-fixed-top">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="adminHome.jsp">SP IT!</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="hidden"><a href="#page-top"></a></li>
				<li><a href="#">Information</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Sort
						Items<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="adminCat.jsp">View Categories</a></li>
						<li><a href="addCat.jsp">Add New Categories</a></li>
						<li><a href="delCatMulti.jsp">Delete Categories</a></li>
						<li class="divider"></li>
						<li><a href="adminPro.jsp">View Products</a></li>
						<li><a href="addPro.jsp">Add New Products</a></li>
						<li><a href="#">Delete Products</a></li>
					</ul></li>
				<li><a href="#">Contact</a></li>
				<li><a href="login.jsp">Logout</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<%
		try {

			String name = "";
			String id = request.getParameter("hiddenCat");
			String descr = "";
			String cnfm = request.getParameter("cnfm");

			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/ead project?user=root&password=root";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			String sql = "select * from categories where CategoryID = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				name = rs.getString("CategoryName");
				descr = rs.getString("CategoryDescription");
			}
	%>
	<div class="clear">
		<div class="row">
			<div class="container">
				<h1>
					Edit Category:
					<%=id%>
					-
					<%=name%></h1>
			</div>
		</div>
	</div>
	<%
		String msg = request.getParameter("msg");
			if (msg != null) {
				out.println("<div class = 'row'><div class = 'container'><kbd>"
						+ msg + "</kbd></div></div>");
			}
	%>

	<div class="container">
		<form action="editCatProcess.jsp" role="form" method="post"
			class="form-horizontal">
			<div class="form-group">
				<label for="CatID" class="col-md-2">Category ID: </label>
				<div class="col-md-10">
					<input type="text" minlength="5" size="5" class="form-control"
						value="<%=id%>" id="CatID" placeholder="Category ID" name="newID">
					<input type="hidden" name="hidID" value="<%=id%>" required>
				</div>
			</div>
			<div class=form-group>
				<label for="CatName" class="col-md-2">Category Name: </label>
				<div class="col-md-10">
					<input class="form-control" type="text" maxlength="50" id="CatName"
						name="name" value="<%=name%>" placeholder="Category Name" required>
				</div>
			</div>
			<div class=form-group>
				<label for="CatDescr" class="col-md-2">CategoryDescription:
				</label>
				<div class="col-md-10">
					<textarea class="form-control" maxlength="100" id="CatDescr"
						name="descr" value="<%=descr%>" rows="4"
						placeholder="Catgory Description"><%=descr%></textarea>
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
				<input type="reset" value="Reset" class="btn btn-warning"> <a
					href="adminCat.jsp"><button type="button" class="btn btn-info">Back</button></a>
			</div>
		</form>
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