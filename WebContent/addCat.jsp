
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
<title>SP IT! | Add Categories</title>
</head>
<body>
	<jsp:include page="adminNav.jsp"></jsp:include>
	<div class="clear">
		<div class="row">
			<div class="container">
				<h1>Create New Category</h1>
			</div>
		</div>
	</div>
	<%
		String cnfm = request.getParameter("cnfm");
		String msg = request.getParameter("msg");
		String cid = request.getParameter("cid");
		String name = request.getParameter("name");
		String descr = request.getParameter("descr");

		if (msg == null) {
			msg = "";
		}
		if (cid == null) {
			cid = "";
		}
		if (name == null) {
			name = "";
		}
		if (descr == null) {
			descr = "";
		}
		if (cnfm == null) {
		} else if (cnfm.equals("n")) {
			out.println("<div class = 'row'><div class = 'container'>"
					+ msg + "</div></div>");
		}
	%>

	<div class="container">
		<form action="addCatProcess.jsp" role="form" method="post"
			class="form-horizontal">
			<div class="form-group">
				<label for="CatID" class="col-md-2">Category ID: </label>
				<div class="col-md-10">
					<input type="text" minlength="5" size="5" class="form-control"
						value="<%=cid%>" placeholder="Category ID" name="cid" required>
				</div>
			</div>
			<div class=form-group>
				<label for="CatName" class="col-md-2">Category Name: </label>
				<div class="col-md-10">
					<input class="form-control" type="text" maxlength="50" id="CatName"
						value="<%=name%>" name="name" placeholder="Category Name" required>
				</div>
			</div>
			<div class=form-group>
				<label for="CatDescr" class="col-md-2">CategoryDescription:
				</label>
				<div class="col-md-10">
					<textarea class="form-control" maxlength="100" id="CatDescr"
						name="descr" rows="4" placeholder="Catgory Description"><%=descr%></textarea>
				</div>
			</div>
			<div class="row">
				<%
					if (cnfm == null) {
						out.println("<input type = 'submit' class = 'btn btn-default' value = 'Confirm'>");
					} else if (cnfm.equals("n")) {
						out.println("<input type = 'submit' class = 'btn btn-danger' value = 'Confirm'>");
					}
				%>
				<input type="reset" value="Clear" class="btn btn-warning"> <a
					href="adminCat.jsp"><button type="button" class="btn btn-info">Back</button></a>
			</div>
		</form>
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