<%
HttpSession Session = request.getSession();
Session.invalidate();
response.sendRedirect("index.jsp");
%>