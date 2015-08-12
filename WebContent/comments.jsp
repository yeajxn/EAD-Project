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
<title>SP IT! | View Product</title>
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
	<%
		try {
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/ead project?user=root&password=root";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);

			String filterSelect = request.getParameter("filterSelect");
			int proCount = 0;

			List<String> comment = new ArrayList<String>();
			List<String> author = new ArrayList<String>();
			List<Integer> rating = new ArrayList<Integer>();
			List<Date> date = new ArrayList<Date>();
			int commentCount = 0;

			String pid2 = request.getParameter("pid");
			String cid2 = request.getParameter("cid");

			String sql2 = "select * from comments where ProductID = ?";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, pid2);
			ResultSet rs2 = pstmt2.executeQuery();

			while (rs2.next()) {
				int i = 0;
				comment.add(i, rs2.getString("Comment"));
				author.add(i, rs2.getString("Author"));
				rating.add(i, rs2.getInt("Rating"));
				date.add(i, rs2.getDate("Date"));
				commentCount++;
			}
	%>

	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="container clear">
		<div class="row text-center">
			<h1><%=pid2%><br> <small><%=commentCount%>
					Comment(s)</small>
			</h1>
			<hr class="star-primary">
		</div>
		<div class="container">
			<%
				for (int i = 0; i < commentCount; i++) {
						out.println("<div class = 'row col-md-5 col-md-offset-3 comment-box'>");
						out.println("<h3><ul class = 'list-inline list-unstyled'>");
						for (int j = 0; j < rating.get(i); j++) {
							out.println("<li><span class = 'glyphicon glyphicon-star'></span></li>");
						}
						for (int j = 0; j < 5 - rating.get(i); j++) {
							out.println("<li><span class = 'glyphicon glyphicon-star-empty'></span></li>");
						}
						out.println("</ul><br><small>by: " + author.get(i) + " on "
								+ date.get(i) + "</small></h3>");
						out.println("<br>" + comment.get(i));
						//out.println("<hr class='star-primary'>");
						out.println("</div>");
					}
			%>
		</div>

	</div>
	<div class="container clear comment-add">
		<form action="addComments.jsp" method="post">
			<input type="hidden" value="<%=cid2%>" name="hidcid"> <input
				type="hidden" value="<%=pid2%>" name="hidpid">
			<div class="row comment-form col-md-offset-8">
				<label class="col-md-1 text-right">Author: </label>
				<div class="col-md-4">
					<input class="form-control" type="text" maxlength="40"
						name="author" placeholder="Name" required>
				</div>
			</div>
			<div class="row comment-form col-md-offset-8">
				<textarea class="form-control" maxlength="1000" rows="10"
					placeholder="Add a comment" name="comment"></textarea>
			</div>
			<div class="row comment-form col-md-offset-8">
				<select class="form-control" name="rating" id="rating">
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
			</div>
			<div class="row col-md-offset-2 comment-form">
				<input type="submit" value="Submit" class="btn btn-success">
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