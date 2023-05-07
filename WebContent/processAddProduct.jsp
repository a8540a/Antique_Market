<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%@page errorPage="error.jsp" %>
<html>
<head>
<title></title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
			
		String filename = "";
		String realFolder = "C:\\Users\\Lee wk\\eclipse-workspace\\web\\FinalProject\\WebContent\\resources\\images";//파일이저장될디렉토리
		int maxSize = 5*1024*1024;
		String encType="utf-8";
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize,encType,new DefaultFileRenamePolicy());
			
		String name			=	multi.getParameter("name");
		String startPrice	=	multi.getParameter("startPrice");
		String description	=	multi.getParameter("description");
		
		Integer price;
		if(startPrice.isEmpty())
			price = 0;
		else
			price = Integer.valueOf(startPrice);
		
		
		Enumeration files = multi.getFileNames();
		String fname =(String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		
		
		
		response.sendRedirect("products.jsp");
	%>
	<%@include file="dbconn.jsp"%>
	<%
			
			PreparedStatement stmt = null;
			
			try{
				String sql= "insert into product(b_name,b_startPrice,b_description,b_isPurchased,b_regid,b_filename) values (?,?,?,?,?,?)";
				stmt=conn.prepareStatement(sql);
				stmt.setString(1, name);
				stmt.setInt(2, Integer.parseInt(startPrice));
				stmt.setString(3, description);
				stmt.setInt(4, 0);
				stmt.setString(5, (String)session.getAttribute("id"));
				stmt.setString(6, fileName);
			
					
				stmt.executeUpdate();
			}catch(SQLException ex){
				System.out.println("error occ");
			}	
		if(stmt!=null)
			stmt.close();
		if(conn !=null)
			conn.close();
	%>
	
	
</body>
</html>