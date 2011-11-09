<%
	if(request.isUserInRole("admin"))
		response.sendRedirect("admins/index.jsp");
	else if(request.isUserInRole("student"))
		response.sendRedirect("students/index.jsp");		
%>
