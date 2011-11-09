<html>
	<body>
		<p>Hello <b><%= request.getUserPrincipal().getName() %></b>!</p>
		<p>Roles:
			<ul>
				<li>admin</li>
			</ul>
		</p>
		<p><a href="../invalidate.jsp">Invalidate Session</a></p>
	</body>
</html>
