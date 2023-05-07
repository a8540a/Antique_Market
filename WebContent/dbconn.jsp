<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import ="java.sql.*"%>
<%@page errorPage="error.jsp" %>
<%
	Connection conn = null;
	
	try{
		String url = "jdbc:mysql://localhost:3306/finalprojectdb";
		String user = "root";
		String password = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,password);
		
	}catch(SQLException ex){
		out.println("연결실패"+ex.getMessage());
	}
%>