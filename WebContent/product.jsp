<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import = "java.net.URLEncoder" %>
<%@page errorPage="error.jsp" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>상품 정보</title>
</head>
<script type = "text/javascript">
	function checkValue(a,b,c){
		var form = document.newValue;
		var userInput = form.price.value;
		if(isNaN(userInput)){
			alert("숫자만 입력하시오");
			return;
		}
		if(parseInt(a)>parseInt(userInput)){
			alert("입찰가보다 높은 값을 입력하시오");
			return;
		}
		if(b==c){
			alert("자신의 물건에는 입찰할 수 없습니다");
			return;
		}
		form.submit();
	}
</script>
<body>
	<%
if(session.getAttribute("id")==null)
	response.sendRedirect("login.jsp");

%>
	
	<%@include file = "menu.jsp" %>
	<%	
		String id = request.getParameter("id");//고유키	
		String price= null;
		String filename = null;
		String name = null;
		String description = null;
		String curuserid=null;
		String regid =null;
		String isPurchased = null;
	%>	
	<%@include file="dbconn.jsp"%>
	<%
			ResultSet rs = null;
			Statement stmt = null;
			
			try{
				String sql= "select * from product where b_id ='"+id+"'";
				stmt=conn.createStatement();
				rs=stmt.executeQuery(sql);
				if(rs.next()){
					price = rs.getString("b_startPrice");
					filename = rs.getString("b_fileName");
					name = rs.getString("b_name");
					description = rs.getString("b_description");
					curuserid=rs.getString("b_currentUserId");
					regid=rs.getString("b_regid");
					isPurchased = rs.getString("b_isPurchased");
				}
					
				
			}catch(SQLException ex){
				System.out.println("error occ");
			}	
		if(rs!=null)
			rs.close();
		if(stmt!=null)
			stmt.close();
		if(conn !=null)
			conn.close();
	%>
	<%
		Cookie[] cookies =request.getCookies();
		int count = 0;
		for(int i = 0; i<cookies.length;i++){
			if(cookies[i].getName().equals(id)){
				count++;
				break;
			}
		}
		if(count==0){
			
			Cookie viewProduct = new Cookie(id,URLEncoder.encode(name,"UTF-8"));
			response.addCookie(viewProduct);
		}

	
	%>
	<hr>
	<div class="container">
	<h1>상품</h1><hr>
		<div class="row">
			<div class="col-md-5">
				<img src="resources/images/<%=filename%>" style="width: 100%">
			</div>
			<div class = "col-md-6">
				<p><b>이름 : </b><%=name %>
				<p><b>현재 입찰가 : </b><%=price %>원
				<p><b>최고 입찰자 ID : </b><%=curuserid %>
				<p><b>상세 설명 : </b><%=description %>
			
			
				<form name = "newValue" action="./callPriceProcess.jsp?id=<%=id %>" class ="form-horizontal" method="post">
					<div class ="form-group row">
						<label class="col-sm-2">입찰가</label>
							<div class="col-sm-3">
								<input type="text" id="price" name="price" class="form-control">
							</div>
					</div>
					<div class="col-sm-offset-2 col-sm-10">
						<%if(Integer.parseInt(isPurchased)==0){
							%><input type="button" class="btn btn-primary" value="입찰" onClick="checkValue('<%=price %>','<%=(String)session.getAttribute("id")%>','<%=regid %>')"><%
						}else{
							%><input type="button" class="btn btn-primary" value="낙찰됨"><%
							
						} %>
						
						
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<%@include file = "footer.jsp" %>
	
		

	
	
	
</body>
</html>
