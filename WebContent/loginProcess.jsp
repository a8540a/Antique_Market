<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "com.oreilly.servlet.*" %>
<%@ page import = "com.oreilly.servlet.multipart.*" %>
<%@ page import = "java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");

String id =request.getParameter("id");
String passwd = request.getParameter("passwd");
%>
	<%@include file="dbconn.jsp"%>
	<%
			ResultSet rs = null;
			Statement stmt = null;
			
			try{
				String sql= "select * from member where id ='"+id+"'";
				System.out.println(sql);
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				if(rs.next()){
					if(rs.getString("password").equals(passwd)){
						session.setAttribute("id", id);
						System.out.println("로그인성공");
						response.sendRedirect("welcome.jsp");
					}else{
						System.out.println("비밀번호오류");
						response.sendRedirect("login.jsp?id=1");
					}
						
					
				}else{
					System.out.println("아이디오류");
					response.sendRedirect("login.jsp?id=1");
				}

			}catch(SQLException ex){
				System.out.println("error occ");
			}finally{
				if(rs!=null)
					rs.close();
				if(stmt!=null)
					stmt.close();
				if(conn !=null)
					conn.close();
					
				
			}	
	
		
	%>