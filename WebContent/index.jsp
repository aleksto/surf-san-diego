<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html>
	<body>
		<%
		    String redirectURL = "sites/home/showNews.do";
		    response.sendRedirect(redirectURL);
		%>

	</body>
</html>


<%
	if(session.getAttribute("theName")!=null && session.getAttribute("thePassword")!=null){
		String name = session.getAttribute("theName").toString();
		out.println("Name: " + name);
		String password = session.getAttribute("thePassword").toString();
		out.println("<br /> Password: " + password);
	}
%>
