<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" import="java.util.List"
	import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>SP IT! | Home</title>

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
		HttpSession Session = request.getSession();
		if (Session == null)
			Session = request.getSession(true);
		Boolean loginCheck = (Boolean) Session.getAttribute("status");
		if (loginCheck == null) {
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<%
		}
		else if (loginCheck == true) {
	%>
	<jsp:include page="adminNav.jsp"></jsp:include>
	<%
		} else {
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<%
		}
	%>

	<!-- Header -->
	<header style="background: #18bc9c url(img/background.jpg) top center;">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<img class="img-responsive" src="img/logo.png" alt="">
				<div class="intro-text">
					<span class="name">SP IT!</span>
					<hr class="star-light">
					<span class="skills">Veni - Vidi - Emi</span>
				</div>
			</div>
		</div>
	</div>
	</header>

	<!-- About Section -->
	<section class="success" id="about">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>About Us</h2>
				<hr class="star-light">
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 col-lg-offset-2">
				<p>SP IT! began in 1953 as a humble mama shop opened by Bob "BB
					Swagmonster28" Black Jr, initially known as SP MAMA. Throughout the
					years, Bob worked and soon his mama shop turned into a chain of
					mama shops. However, economic conditions proved too difficult for
					SP MAMA to progress further selling only the usual mama store
					products.</p>
				<p>This proved to be the case till 1980 when Bob decided to
					expand his business to sell clothing as well. Forming a partnership
					with Ngee Ann Clothing, SP MAMA's business began to soar and by
					1996, SP MAMA had over 20 outlets around Singapore.</p>
			</div>
			<div class="col-lg-4">
				<p>However, the world economic crisis in the 2008 and the
					passing of Bob Black Jr. SP MAMA faced uncertain times</p>
				<p>As the economy has stabilized, SP MAMA re-branded to SP IT!
					now selling electronic products. Under the leadership of Bob Black
					The Third</p>
				<p>With the same motivation for excellence that the late Bob
					had, SP IT! aims to provide the best services and be the premium IT
					products seller in Singapore and beyond!</p>
			</div>
		</div>
	</div>
	</section>
	<section id="contact">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h2>Contact Us</h2>
				<hr class="star-primary">
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 text-center">
				<h4>enquiries@SPIT.com</h4>
			</div>
		</div>
	</div>
	</section>
	<!-- Footer -->
	<footer class="text-center">
	<div class="footer-above">
		<div class="container">
			<div class="row">
				<div class="footer-col col-md-4">
					<h3>Location</h3>
					<p>500 Dover Road, 139651</p>
				</div>
				<div class="footer-col col-md-4">
					<ul class="list-inline">
						<li><a href="#" class="btn-social btn-outline"><i
								class="fa fa-fw fa-facebook"></i></a></li>
						<li><a href="#" class="btn-social btn-outline"><i
								class="fa fa-fw fa-google-plus"></i></a></li>
						<li><a href="#" class="btn-social btn-outline"><i
								class="fa fa-fw fa-twitter"></i></a></li>
					</ul>
				</div>
				<div class="footer-col col-md-4">
					<h3>About Freelancer</h3>
					<p>
						Freelance is a free to use, open source Bootstrap theme created by
						<a href="http://startbootstrap.com">Start Bootstrap</a> and used
						in the designing of this webpage!
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="footer-below">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">Copyright &copy; SP IT! 2015</div>
			</div>
		</div>
	</div>
	</footer>



	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div class="scroll-top page-scroll visible-xs visible-sm">
		<a class="btn btn-primary" href="#page-top"> <i
			class="fa fa-chevron-up"></i>
		</a>
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

	<!-- Contact Form JavaScript -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/freelancer.js"></script>

</body>

</html>
