<%@ page
	import="model.*, java.sql.*, java.util.List, java.util.ArrayList"%>
<%
	DBconnect NavBarConn = new DBconnect();
	Connection NavConn = NavBarConn.conn();
	int catCount = 0;
	List<String> cid = new ArrayList<String>();
	List<String> cname = new ArrayList<String>();

	String sql = "select * from categories";
	PreparedStatement pstmt = NavConn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();

	while (rs.next()) {
		cid.add(catCount, rs.getString("CategoryID"));
		cname.add(catCount, rs.getString("CategoryName"));
		catCount++;
	}
%>
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
			<a class="navbar-brand" href="index.jsp">SP IT!</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="hidden"><a href="#page-top"></a></li>
				<li class="dropdown"><a href="shop.jsp" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">
						Shop <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<%
							for (int i = 0; i < catCount; i++) {
								out.println("<li><a href = 'filterSet.jsp?source=shop&filterSelect="
										+ cid.get(i) + "'>" + cname.get(i) + "</a></li>");
							}
						%>

						<li class="divider"></li>
						<li><a href="#">Cart</a></li>
					</ul></li>
				<li><a href="index.jsp#about">About</a></li>
				<li><a href="index.jsp#contact">Contact</a></li>

				<%
					HttpSession Session = request.getSession(false);
					Boolean login = (Boolean) Session.getAttribute("status");
					if (login != null) {
						out.println("<li><a href='Profile.jsp'>Edit Profile</a></li>");
						out.println("<li><a href='logout.jsp'>Logout</a></li>");
					} else
						out.println("<li><a href='login.jsp'>Login/Register</a></li>");
				%>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>

<%
	NavConn.close();
%>