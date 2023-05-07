<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>물품 목록</title>
</head>
<body>
		<jsp:include page ="menu.jsp"/>
	<div class="container">
		<h3>낙찰된 물건들</h3><hr>
		<%@include file="dbconn.jsp"%>
		<%
			PreparedStatement temp = null;
			ResultSet rs = null;
			String id = (String)session.getAttribute("id");
			String sql= "select * from product where b_currentUserId ='"+id+"' AND b_isPurchased = 1";
			System.out.println(sql);
			temp = conn.prepareStatement(sql);
			rs = temp.executeQuery();
			
			while(rs.next()){
		%>
		
		<div class="row">
		<div class ="col">
			<h3><%=rs.getString("b_name") %></h3>
			<p>낙찰가 : <%=rs.getString("b_startPrice") %>원

			
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
