
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
<%@page import="java.sql.*, controller.*, model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String cid = request.getParameter("cid");
		String descr = request.getParameter("descr");
		String name = request.getParameter("name");
		DBconnect DBconn = new DBconnect();
		Connection conn = DBconn.conn();

		String sql = "insert into categories (CategoryID, CategoryName, CategoryDescription))values (?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, cid);
		pstmt.setString(2, name);
		pstmt.setString(3, descr);
		int check = pstmt.executeUpdate();

		if (check == 0) {
			response.sendRedirect("addCat.jsp?cid=" + cid + "&descr="
					+ descr + "&name=" + name + "cnfm=n");
		} else {
			response.sendRedirect("editCat.jsp?hiddenCat=" + cid
					+ "&msg=Category Added!&cnfm=y");
		}
		conn.close();
	%>

</body>
</html>