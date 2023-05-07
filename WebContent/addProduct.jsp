<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page errorPage="error.jsp" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<script type ="text/javascript" src="./resources/js/validation.js"></script>
<title>상품 등록</title>
</head>
<body>
	<%
if(session.getAttribute("id")==null)
	response.sendRedirect("login.jsp");
	%>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename = "bundle.message">
	<%@include file = "menu.jsp" %>
	<div class="jumbotron">
		<div class ="container">
			<h1 class="display-3">상품 등록</h1>
		</div>
	</div>
	<div class="container">
		<form name = "newProduct" action="./processAddProduct.jsp" class ="form-horizontal" method="post" enctype="multipart/form-data">
			<div class ="form-group row">
				<label class="col-sm-2">상품이름</label>
				<div class="col-sm-3">
					<input type = "text" id = "name" name = "name" class ="form-control">
				</div>
			</div>
			<div class ="form-group row">
				<label class="col-sm-2">시작가격</label>
				<div class="col-sm-3">
					<input type = "text" id = "startPrice" name = "startPrice" class ="form-control">
				</div>
			</div>
			<div class ="form-group row">
				<label class="col-sm-2">상세정보</label>
				<div class="col-sm-3">
					<textarea name = description cols="50" rows="2" class ="form-control"></textarea>
				</div>
			</div>
			<div class ="form-group row">
				<label class="col-sm-2">상품이미지</label>
				<div class="col-sm-5">
					<input type = "file" name = "image" class ="form-control">
				</div>
			</div>
			<div class ="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type = "button" class ="btn btn-primary" value="등록" onclick="CheckAddProduct()">
				</div>
			</div>
		</form>
	</div>
	</fmt:bundle>
	<%@include file = "footer.jsp" %>
</body>
</html>