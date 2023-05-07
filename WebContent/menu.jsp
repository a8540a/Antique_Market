<nav class ="navbar navbar-expand		navbar-dark bg-dark">
	<div class = "container">
		<div class = "navbar-header">
			<a class = "navbar-brand" href="./welcome.jsp">Home</a>
			<%
				if(session.getAttribute("id")!=null){%>
				<a href="./session_out.jsp" class = "btn btn-secondary" role="button">Log out</a>
			<% }%>
		</div>
	</div>
</nav>