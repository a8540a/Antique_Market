<%@ page contentType="text/html; charset=utf-8" %>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>login</title>
</head>
<body>
<%
if(session.getAttribute("id")!=null)
	response.sendRedirect("welcome.jsp");

%>
	<jsp:include page= "menu.jsp"/>
	<div class ="jumbotron">
		<div class ="container">
			<h1 class ="display-3">로그인</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class = "form-signin-heading">Please sign in</h3>
		<form class="form-signin" action="loginProcess.jsp" method="post">
			<div class="form-group">
				<label for ="inputUserName" class="sr-only">
					User Name
				</label>
				<input type="text" class="form-control" placeholder="id" name="id" required autofocus>
			</div>
			
			<div class="form-group">
				<label for ="inputUserName" class="sr-only">
					Password
				</label>
				<input type="password" class="form-control" placeholder="passwd" name="passwd" required>
			</div>
			<button class="btn btn btn-lg btn-success btn-block" type="submit">로그인</button>
			<%
				
				String error= request.getParameter("id");
				System.out.println(error);
			if(error!=null){
				if(error.equals("1")){%>
					<p style="color:red;">아이디 혹은 비밀번호 오류입니다</p><%
				}
			}
			%>
		
		</form>
	</div>
	</div>
</body>

</html>