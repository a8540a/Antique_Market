<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="dbconn.jsp"%>
<%@page errorPage="error.jsp" %>
<body>
		<%	
		String id = request.getParameter("id");
		String price = request.getParameter("price");
		
		PreparedStatement temp = null;
		ResultSet rs = null;
		String sql = "UPDATE product SET b_startPrice = ? ,b_currentUserId = ? WHERE b_id = ? AND b_startPrice < ?";
		temp=conn.prepareStatement(sql);
		temp.setInt(1, Integer.parseInt(price));
		temp.setString(2, (String)session.getAttribute("id"));
		temp.setString(3, id);
		temp.setInt(4, Integer.parseInt(price));
		System.out.println(sql);
		temp.executeUpdate();
				
		if(temp!=null)
			temp.close();
		if(conn !=null)
			conn.close();
		response.sendRedirect("./product.jsp?id="+id);
			 	
	%>
</body>	
	

		


