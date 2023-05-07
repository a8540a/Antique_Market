<%@ page contentType="text/html; charset=utf-8" %>
<%@include file="dbconn.jsp"%>
<%@page errorPage="error.jsp" %>
<body>
		<%	
		String id = request.getParameter("id");
		String price = request.getParameter("price");
		
		PreparedStatement temp = null;
		ResultSet rs = null;
		String sql = "UPDATE product SET b_isPurchased = ? WHERE b_id = ?";
		temp=conn.prepareStatement(sql);
		temp.setInt(1, 1);
		temp.setString(2, id);
		System.out.println(sql);
		temp.executeUpdate();
				
		if(temp!=null)
			temp.close();
		if(conn !=null)
			conn.close();
		response.sendRedirect("./product.jsp?id="+id);
			 	
	%>
</body>	
	

		


