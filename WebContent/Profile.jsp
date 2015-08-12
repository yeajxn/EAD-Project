<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="controller.*, model.*"%>
<%
	HttpSession Session = request.getSession(false);
	Boolean loginCheck = (Boolean) Session.getAttribute("status");
	if (loginCheck == null) {
		response.sendRedirect("index.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>SP IT! | Edit Profile</title>

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

<body id="page-top" class="index">
	<%
		if (loginCheck == true) {
	%>
	<jsp:include page="adminNav.jsp"></jsp:include>
	<%
		} else {
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<%
		}
	%>
	<div class="clear"></div>
	<%
		UserDetails user = (UserDetails) Session.getAttribute("user");
		String name = user.getName();
		String address = user.getAddress();
		String contact = user.getContact();
		String email = user.getEmail();
		String password = user.getPassword();
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-9">
				<h1>Update your details</h1>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="col-md-3"></div>
		<div class="col-md-9">
			<form action="UpdateUser" method="post">
				<div class="form-group col-xs-8">
					<label>Name</label> <input type="text" class="form-control"
						placeholder="Your Name" name="name" value=<%=name%>>
				</div>
				<div class="form-group col-xs-8">
					<label>Password</label> <input type="password" class="form-control"
						placeholder="Your Name" name="password" value=<%=password%>>
				</div>
				<div class="form-group col-xs-8">
					<label>Email address</label> <input type="email"
						class="form-control" placeholder="Email" name="email"
						value=<%=email%>>
				</div>
				<div class="form-group col-xs-8">
					<label>Contact</label> <input type="text" name="contact"
						class="form-control" placeholder="Your Phone Number"
						value=<%=contact%>>
				</div>
				<label class="col-xs-8">Address</label>
				<div class="form-group col-xs-8">
					<textarea class="form-control" name="address" maxlength="200"
						rows="3"><%=address%></textarea>
				</div>
				<div class="row">
					<div class="col-xs-8">
						<input type="Submit" class="btn btn-primary"> <input
							type="reset" class="btn btn-danger">
					</div>
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
	</div>
	<div class="clear"></div>
	
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