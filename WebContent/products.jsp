<%@ page contentType="text/html; charset=utf-8" %>
<%@page errorPage="error.jsp" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>물품 목록</title>
</head>
<body>
	<%
if(session.getAttribute("id")==null)
	response.sendRedirect("login.jsp");

%>
	<jsp:include page ="menu.jsp"/>
	<div class="container">
		<h1>판매중인 물품들</h1><hr>
		<%@include file="dbconn.jsp"%>
		<%
			PreparedStatement temp = null;
			ResultSet rs = null;
			String sql = "select * from product";
			temp = conn.prepareStatement(sql);
			rs = temp.executeQuery();
			
			while(rs.next()){
				String filename = rs.getString("b_fileName");
		%>
		
		<div class="row">
		<div class ="col-md-3">
			<img src="resources/images/<%=filename%>" style="width: 100%">
			</div>
		<div class ="col">
			<h3><%=rs.getString("b_name") %></h3>
			<p>현재 입찰가 : <%=rs.getString("b_startPrice") %>원
			<p><a href="./product.jsp?id=<%=rs.getString("b_id") %>" class = "btn btn-secondary" role="button">입찰 &raquo></a>
		</div>
		</div>
		<%}%>
		<hr>
		</div>
		
	
	
	<jsp:include page ="footer.jsp"/>
		<% 
		if(rs!=null)
			rs.close();
		if(temp!=null)
			temp.close();
		if(conn !=null)
			conn.close();
		%>
</body>
</html>
