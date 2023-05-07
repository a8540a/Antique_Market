<%@ page contentType="text/html; charset=utf-8"%>
<%@page errorPage="error.jsp" %>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		session.invalidate();

		response.sendRedirect("login.jsp");
		
		
	%>
</body>
</html>