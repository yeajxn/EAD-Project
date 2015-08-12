<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String source = request.getParameter("source");
		if (source.equals("adminPro")) {
			String filterSelect = request.getParameter("filterSelect");
			if (filterSelect == null) {
				filterSelect = "All";
			}
			response.sendRedirect("adminPro.jsp?filterSelect="
					+ filterSelect);
		}
		if (source.equals("shop")) {
			String filterSelect = request.getParameter("filterSelect");
			if (filterSelect == null) {
				filterSelect = "new";
			}
			response.sendRedirect("shop.jsp?filterSelect=" + filterSelect);
		}
	%>
</body>
</html>