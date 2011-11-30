
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>The surfer</title>
	<link href="./../../../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%
	if(session.getAttribute("theName")!=null && session.getAttribute("thePassword")!=null){
		String name = session.getAttribute("theName").toString();
		out.println("Name: " + name);
		String password = session.getAttribute("thePassword").toString();
		out.println("<br /> Password: " + password);
	}
%>

<div id="wrapper">
	<div id="header">
		<div id= "head">
			<h1> <a href ="index.jsp" style ="text-decoration:none"> The surfer</a>
			</h1>
		</div>
			
		<div id="user">
			<a href="home.jsp" style ="text-decoration:none">Login</a>
			<a href="../../../register/registerUserInformation.jsp" style ="text-decoration:none">Register new user</a>
		</div>
		<div id="pages">
			<ul>
				<li><a href="../../../sites/home/showNews.do">Home</a></li>
				<li><a href="../../../sites/beaches/showBeaches.do">Beaches</a></li>
				<li><a href="../../../sites/beaches/showBeaches.do">Weather</a></li>
			
			</ul>
		</div>
		<div style="clear:both"></div>
	</div>
	<div id="main-content">
		<div id="content-area">
			<div id="top-photo">
				<div id="photo-caption">
				<p>&raquo; Lets go surfing now...
				</p></div>
			</div>
			<h2>Login</h2>
			<p> 
			<% 
				String username = request.getParameter("j_username");
				String password = request.getParameter("j_password");
				
				out.println("Wrong username or password, please try again!");
			%> 
			</p>
			 
			 <p>
			 <form method="POST" action="j_security_check">
				<div id="username">
					<p>Username:<input size="20" name="j_username" type="text"/><br/></p>
				</div>
				<div id="password">
					<p>Password:<input size="20" name="j_password" type="password"/><br/></p>
				</div>
				
				<p><input type="submit" value="Login"/></p>
			</form> 
			 </p>
			
		</div>
		<div id="sidebar">
			<h3>Something fun </h3>
			
		</div>
		<div style="clear:both"></div>
	</div>
	<div id="footer">
		<p> Copyright Ali, Maria, Ingrid. All Rights Reserved </p>
	</div>
</div>
</body>
</html>