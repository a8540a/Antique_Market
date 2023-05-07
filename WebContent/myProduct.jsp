<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>물품 목록</title>
</head>
<body>
		<jsp:include page ="menu.jsp"/>
	<div class="container">
		<h3>판매중인 리스트</h3><hr>
		<%@include file="dbconn.jsp"%>
		<%
			PreparedStatement temp = null;
			ResultSet rs = null;
			String id = (String)session.getAttribute("id");
			String sql= "select * from product where b_regid ='"+id+"'";
			System.out.println(sql);
			temp = conn.prepareStatement(sql);
			rs = temp.executeQuery();
			
			while(rs.next()){
		%>
		
		<div class="row">
		<div class ="col">
			<h3><%=rs.getString("b_name") %></h3>
			<p>현재 입찰가 : <%=rs.getString("b_startPrice") %>원</h3>
			<p>낙찰  : 
			<%
				if(rs.getInt("b_isPurchased")==0 ){
					%><a href="./sellProduct.jsp?id=<%=rs.getString("b_id") %>" class = "btn btn-secondary" role="button">낙찰 &raquo></a><%
				}else{
					%><a class = "btn btn-secondary" role="button">낙찰됨</a><%			
				}
			%>
			
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
