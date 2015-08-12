<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<!-- Register Form Validation -->
<script type="text/javascript" src = "js/validateRegister.js"></script>

<title>SP IT! | Register</title>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<!--Sign Up Form -->
	<div class="login">
		<div class="row">
			<h1>
				Sign Up Here!!
				</h3>
		</div>
		<div class="container">
			<form action="SignUp" role="form" method="post"
				name="RegistrationForm" class="form-horizontal">

				<div class=form-group>
					<label class="col-md-1">Name: </label>
					<div class="col-md-11">
						<input class="form-control" type="text" name="name" id="name"
							placeholder="Your Name" required>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-1">Email: </label>
					<div class="col-md-11">
						<input type="text" minlength="5" maxlength="100"
							class="form-control" placeholder="Your Email" name="email"
							id="email" required>
					</div>
				</div>

				<div class=form-group>
					<label class="col-md-1">Password: </label>
					<div class="col-md-11">
						<input class="form-control" type="text" maxlength="50"
							id="Password" name="passwd" id="passwd"
							placeholder="Minimum 8 characters required" required>
					</div>
				</div>

				<div class=form-group>
					<label class="col-md-1">Phone Number </label>
					<div class="col-md-11">
						<input class="form-control" type="text" name="contact"
							placeholder="Please enter an 8 digit phone number">
					</div>
				</div>
				<div class="clear"></div>

				<div class="row">
					<%
						String cnfm = request.getParameter("cnfm");
						if (cnfm == null) {
							out.println("<input type = 'submit' class = 'btn btn-default' value = 'Sign Up' onclick = 'return validateRegistration()'>");
						} else {
							out.println("<input type = 'submit' class = 'btn btn-danger' value = 'Sign Up' onclick = 'return validateRegistration()'>");
						}
					%>
					<input type="reset" value="Clear" class="btn btn-warning">
				</div>
				<br>
				<div class="row">
					<%
						String msg = request.getParameter("msg");
						if (msg != null) {
							out.println("<kbd>" + msg + "</kbd>");
						}
					%>
				</div>
			</form>
		</div>
		<div class = "clear"></div>
	</div>

	<!--Footer -->
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