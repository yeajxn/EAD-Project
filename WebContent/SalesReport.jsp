
<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<%
	HttpSession Session = request.getSession(false);
	if (Session != null) {
		Boolean admin = (Boolean) Session.getAttribute("status");
		if (admin == null) {
			response.sendRedirect("index.jsp");
		} else if (admin != true) {
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
	<%
		String month = request.getParameter("month");
		String year = request.getParameter("year");
	%>
	<jsp:include page="adminNav.jsp"></jsp:include>
	<div class="clear"></div>
	<div class="container">
		<h1>Select a Month and Year!</h1>
		<form action="GetSalesReport" method="post" class="col-xs-10">
			<div class="col-xs-2">
				<select class="form-control" name="month">
					<option value="1">January</option>
					<option value="2">February</option>
					<option value="3">March</option>
					<option value="4">April</option>
					<option value="5">May</option>
					<option value="6">June</option>
					<option value="7">July</option>
					<option value="8">August</option>
					<option value="9">September</option>
					<option value="10">October</option>
					<option value="11">November</option>
					<option value="12">December</option>
				</select>
			</div>
			<div class="col-xs-2">
				<select class="form-control" name="year">
					<%
						for (int i = 2015, j = 0; j < 100; i--, j++) {
							out.println("<option value = '" + i + "'>" + i + "</option>");
						}
					%>
				</select>
			</div>
			<div class="col-xs-3">
				<select class="form-control" name="sort">
					<option value="pro">--By Products--</option>
					<option value="tra">--By Transactions--</option>
				</select>
			</div>
			<div class="col-xs-3">
				<input type="submit" class="btn btn-primary" value="Select">
			</div>
		</form>
	</div>
	<%
		String ReportType = (String) Session.getAttribute("ReportType");
		if (ReportType == null) {
		} else if (ReportType.equals("tra")) {
			ArrayList<SalesRepTransactions> List = (ArrayList<SalesRepTransactions>) Session
					.getAttribute("Report");
			int transactionsMade = List.size();
			double earnings = 0;
			for (int i = 0; i < List.size(); i++) {
				earnings += List.get(i).getTotalPrice();
			}
	%>
	<div class="container">
		<h2><%=transactionsMade%>
			Transaction(s) Made
		</h2>
		<h2>
			$<%=earnings%>
			In Revenue
		</h2>
		<h3>
			For
			<%=month%>
			<%=year%></h3>
	</div>
	<div class="container">
		<table class="table table-hover">
			<thead>
				<th>#</th>
				<th>Transaction ID</th>
				<th>Buyer ID</th>
				<th>Amount Spent</th>
			</thead>
			<tbody>
				<%
					for (int k = 0, m = 1; k < List.size(); k++, m++) {
				%>
				<tr>
					<td><%=m%></td>
					<td><%=List.get(k).getTransactionID()%></td>
					<td><%=List.get(k).getBuyerID()%></td>
					<td><%=List.get(k).getTotalPrice()%></td>
				</tr>

				<%
					}
				%>
			</tbody>
			<%
				} else if (ReportType.equals("pro")) {
					ArrayList<SalesRepProducts> List = (ArrayList<SalesRepProducts>) Session
							.getAttribute("Report");
					int products = 0;
					double earnings = 0;
					for (int i = 0; i < List.size(); i++) {
						products += List.get(i).getQuantity();
						earnings += (List.get(i).getUnitPrice())
								* (List.get(i).getQuantity());
					}
			%>
			<div class="container">
				<h2><%=products%>
					Product(s) Sold
				</h2>
				<h2>
					$<%=earnings%>
					In Revenue
				</h2>
				<h3>
					For
					<%=month%>
					<%=year%></h3>
			</div>
			<div class="container">
				<table class="table table-hover">
					<thead>
						<th>Product ID</th>
						<th>Quantity</th>
						<th>Unit Price</th>
						<th>Total Earned</th>
					</thead>
					<tbody>
						<%
							for (int l = 0; l < List.size(); l++) {
						%>
						<tr>
							<td><%=List.get(l).getProductID()%></td>
							<td><%=List.get(l).getQuantity()%></td>
							<td><%=List.get(l).getUnitPrice()%></td>
							<td>
								<%
									Double total = List.get(l).getQuantity()
													* List.get(l).getUnitPrice();
											out.println(total);
								%>
							</td>
						</tr>

						<%
							}
						%>
					</tbody>
					<%
						}
						Session.removeAttribute("Report");
						Session.removeAttribute("ReportType");
					%>

				</table>
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