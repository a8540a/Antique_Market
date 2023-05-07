<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import ="java.util.Locale" %>
<%@ page import = "java.net.URLDecoder" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page errorPage="error.jsp" %>
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<html>
<head>
<title>메인</title>
</head>
<body>
	
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<%@include file = "menu.jsp" %>
	
	<div class = "jumbotron">
		<div class = "container">
		<a href="?language=ko">한국어</a>|<a href="?language=en">English</a>
			<h1 class = "display-3">
				<fmt:message key="marketName" />
			</h1>
			<% if(session.getAttribute("id")==null){
				%><h3><fmt:message key="loginMessage" /></h3>
				<br><br><a href="./session_out.jsp" class = "btn btn-secondary" role="button"><fmt:message key="login" /></a>
				<%}else{%>
				<h3><%=(String)session.getAttribute("id") %><fmt:message key="welcomeMessage" /></h3>
				<br><br><a href="./myProduct.jsp" class = "btn btn-secondary" role="button"><fmt:message key="myproduct" /></a>
				<br><br><a href="./myProductGet.jsp" class = "btn btn-secondary" role="button"><fmt:message key="myproductget" /></a>
				<br><br><a href="./session_out.jsp" class = "btn btn-secondary" role="button"><fmt:message key="logout" /></a><%	
			}%>
				
			
			
			
		</div>
	</div>
	
	<div class = "container">
		<div class = "text-center">
			<h3>
				<fmt:message key="phrase" />
			</h3>
		</div>
		<div class="row">
			<img src="resources/images/1.png" style="width: 10%">
			<img src="resources/images/2.png" style="width: 10%">
			<img src="resources/images/3.png" style="width: 10%">
			<img src="resources/images/4.png" style="width: 10%">
			<img src="resources/images/5.png" style="width: 10%">
			<img src="resources/images/6.png" style="width: 10%">
			<img src="resources/images/7.png" style="width: 10%">
			<img src="resources/images/8.png" style="width: 10%">
			<img src="resources/images/9.png" style="width: 10%">
			<img src="resources/images/10.png" style="width: 10%">
		</div>
		<hr>
			<div class ="row" style="text-align:center">
			<div class="col-md-3">
			<fmt:message key="buyMessage" />
			<br><a href="./products.jsp" class = "btn btn-secondary" role="button"><fmt:message key="buy" /></a>
			</div>
			<div class = "col-md-3">
			<fmt:message key="sellMessage" />
			<br><a href="./addProduct.jsp" class = "btn btn-secondary" role="button"><fmt:message key="sell" /></a>
			</div>
			<div class = "col-md-3">
			<fmt:message key="recent" /><br>
			<%
			Cookie[] cookies =request.getCookies();
			if(cookies.length==1){
				%><fmt:message key="norecent" /><%
				
			}
				
			for(int i = 0; i<cookies.length-1;i++){
				String temp = URLDecoder.decode(cookies[i].getValue(),"UTF-8");
				String address = URLDecoder.decode(cookies[i].getName(),"UTF-8");
				%><a href="./product.jsp?id=<%=address%>" role="button"><%=temp %></a><br><% 
				
			}
			
			
			
			%>
			</div>		
	</div>
		
		
		
		
	</div>
	<hr>

			
	<%@include file = "footer.jsp" %>
	</fmt:bundle>
</body>
</html>

