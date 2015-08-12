<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="controller.*, java.sql.*, java.util.List, java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>SP IT! | Login</title>
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

<!-- Login Javascript validation -->
<script src="js/validateLogin.js" type="text/javascript"></script>

</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="login">
		<div class="container-fluid">
			<div class="row">
				<h1 class="col-sm-10">Login</h1>
			</div>
			<form action="authenticate" method="get" class="form-horizontal"
				role="form">
				<div class="form-group">
					<label class="control-label" for="email">Email:</label> <input
						type="text" class="form-control" id="email" name="email"
						placeholder="Enter email">
				</div>
				<div class="form-group">
					<label class="control-label" for="pwd">Password:</label> <input
						type="password" class="form-control" id="password" name="password"
						placeholder="Enter password">
				</div>
				<div class="form-group">
					<input type="submit" value="Submit"
						onclick="return validateLogin()" class="btn btn-success">
				</div>
				<div class="row">
					<%
						String msg = request.getParameter("msg");
						if (msg != null) {
							out.println("<kbd>" + msg + "</kbd>");
						}
					%>
				</div>
				<br> <br> <br> <br>
			</form>

			<div class="row">
				<div class="col-md-10 col-xs-12 text-right">
					<h4>Don't have an SP IT! account?</h4>
				</div>
				<a href="register.jsp"><button type=button
						class="btn btn-info col-md-2 col-xs-12">Register Now!</button></a>
			</div>
		</div>
		<div class="clear"></div>
	</div>

	<footer>
	<div class="footer-below">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">Copyright &copy; SP IT! 2015</div>
			</div>
		</div>
	</div>
	</footer>
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