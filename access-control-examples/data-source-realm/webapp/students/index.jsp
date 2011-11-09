<html>
	<body>
		<p>Hello <b><%= request.getUserPrincipal().getName() %></b>!</p>
		<p>Roles:
			<ul>
			<% if (request.isUserInRole("admin")) { %>
				<li>admin</li>
			<% } %>
			<% if (request.isUserInRole("student")) { %>
				<li>student</li>
			<% } %>
			</ul>
		</p>
		<p><a href="../invalidate.jsp">Invalidate Session</a></p>
	</body>
</html>