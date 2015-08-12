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
<title>SP IT! | Shop</title>
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
			String cNameSel = "";
	%>

	<%
		HttpSession Session = request.getSession(false);
			Boolean loginCheck = (Boolean) Session.getAttribute("status");
			if (loginCheck == null) {
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<%
		} else if (loginCheck == true) {
	%>
	<jsp:include page="adminNav.jsp"></jsp:include>
	<%
		} else {
	%>
	<jsp:include page="navbar.jsp"></jsp:include>
	<%
		}
	%>

	<%
		String sql2 = "select CategoryName from categories where CategoryID = ?";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, filterSelect);
			ResultSet rs2 = pstmt2.executeQuery();
			while (rs2.next()) {
				cNameSel = rs2.getString("CategoryName");
			}
	%>

	<div class="container-fluid clear">
		<div class="row">
			<div class="col-lg-12 text-center">
				<h1 class="SUPERSIZE">
					Shop -
					<%=cNameSel%></h1>
				<hr class="star-primary">
			</div>
		</div>

	</div>
	<%
		String sql3 = "select * from products where CategoryID = ?";
			PreparedStatement pstmt3 = conn.prepareStatement(sql3);
			pstmt3.setString(1, filterSelect);
			ResultSet rs3 = pstmt3.executeQuery();

			while (rs3.next()) {
				proCount++;
			}
	%>
	<div class="container">
		<div class="row text-right">
			<h4>
				<%
					if (proCount == 1) {
							out.println("1 Product Available");
						} else
							out.println(proCount + " Products Available");
				%>

			</h4>
		</div>
	</div>

	<!-- shop Grid Section -->
	<section id="shop"> <%
 	String sql4 = "select * from products where CategoryID = ?";
 		PreparedStatement pstmt4 = conn.prepareStatement(sql4);
 		pstmt4.setString(1, filterSelect);
 		ResultSet rs4 = pstmt4.executeQuery();

 		List<String> pid = new ArrayList<String>();
 		List<String> brand = new ArrayList<String>();
 		List<String> descr = new ArrayList<String>();
 		List<String> specs = new ArrayList<String>();
 		List<String> img = new ArrayList<String>();
 		List<Double> price = new ArrayList<Double>();
 		List<Integer> quantity = new ArrayList<Integer>();
 		int proCount2 = 0;

 		while (rs4.next()) {
 			pid.add(proCount2, rs4.getString("ProductID"));
 			brand.add(proCount2, rs4.getString("Brand"));
 			descr.add(proCount2, rs4.getString("Description"));
 			specs.add(proCount2, rs4.getString("Specifications"));
 			price.add(proCount2, rs4.getDouble("price"));
 			img.add(proCount2, rs4.getString("Image"));
 			proCount2++;
 		}
 		int proCount3 = 0;
 		int proCount4 = 0;

 		for (int i = 0; i < proCount / 3; i++) {
 			out.println("<div class='container'> <div class='row'>");
 			for (int j = 0; j < 3; j++) {
 				out.println("<div class='col-sm-4 shop-item'>");
 				out.println("<a href='#shopModal" + proCount3
 						+ "' class='shop-link' data-toggle='modal'>");
 				out.println("<div class='caption'>");
 				out.println("<div class='caption-content'>");
 				out.println("<i class='fa fa-search-plus fa-3x'></i>");
 				out.println("</div>");
 				out.println("</div> <img src='"
 						+ img.get(proCount3)
 						+ "' class='img-responsive shop-thumb center-block' alt=''>");
 				out.println("</a>");
 				out.println("</div>");
 				proCount3++;
 			}
 			out.println("</div></div>");
 			out.println("<div class='container'> <div class='row'>");
 			for (int j = 0; j < 3; j++) {
 				out.println("<div class='col-sm-4'>");
 				out.println("<h3>" + brand.get(proCount4)
 						+ "<br><small>" + pid.get(proCount4)
 						+ "</small></h3>");
 				out.println("</div>");
 				proCount4++;
 			}
 			out.println("</div></div>");

 		}

 		if (proCount % 3 != 0) {
 			out.println("<div class='container'> <div class='row'>");
 			for (int i = 0; i < proCount % 3; i++) {
 				out.println("<div class='col-sm-4 shop-item'>");
 				out.println("<a href='#shopModal" + proCount3
 						+ "' class='shop-link' data-toggle='modal'>");
 				out.println("<div class='caption'>");
 				out.println("<div class='caption-content'>");
 				out.println("<i class='fa fa-search-plus fa-3x'></i>");
 				out.println("</div>");
 				out.println("</div> <img src='"
 						+ img.get(proCount3)
 						+ "' class='img-responsive shop-thumb center-block' alt=''>");
 				out.println("</a>");
 				out.println("</div>");
 				proCount3++;
 			}
 			out.println("</div></div>");
 			out.println("<div class='container'> <div class='row'>");
 			for (int j = 0; j < proCount % 3; j++) {
 				out.println("<div class='col-sm-4'>");
 				out.println("<h3>" + brand.get(proCount4)
 						+ "<br><small>" + pid.get(proCount4)
 						+ "</small></h3>");
 				out.println("</div>");
 				proCount4++;
 			}
 			out.println("</div></div>");
 		}
 %> </section>
	<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
	<div class="scroll-top page-scroll visible-xs visible-sm">
		<a class="btn btn-primary" href="#page-top"> <i
			class="fa fa-chevron-up"></i>
		</a>
	</div>






	<!-- shop Modals -->
	<%
		for (int i = 0; i < proCount; i++) {
	%>
	<div class="shop-modal modal fade" id="shopModal<%=i%>" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div>
						<div class="row">
							<div class="modal-body">
								<h2><%=brand.get(i)%>-<%=pid.get(i)%></h2>
								<hr class="star-primary">
								<h3>
									$<%=price.get(i)%></h3>
								<img src="<%=img.get(i)%>" class="img-responsive img-centered"
									alt="">
								<div class="test col-md-6">
									<p>
										<kbd>Description:</kbd>
										<br>
										<%=descr.get(i)%>
									</p>
								</div>
								<div class="test col-md-6">
									<p>
										<kbd>Specifications:</kbd>
										<br><%=specs.get(i)%>
									</p>
								</div>
							</div>
						</div>
						<div class="row">
							<ul class="list-inline item-details">
								<li><strong><a
										href="comments.jsp?pid=<%=pid.get(i)%>&cid=<%=filterSelect%>">See
											Comments</a></strong></li>
							</ul>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">
								<i class="fa fa-times"></i> Close
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%>

	<%
		conn.close();
		} catch (Exception e) {
			out.println(e);
		}
	%>

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