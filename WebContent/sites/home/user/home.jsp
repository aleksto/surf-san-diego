<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>The surfer</title>
	<link href="./../../../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>




<div id="wrapper">
	<div id="header">
		<div id= "head">
			<h1> <a href ="index.jsp" style ="text-decoration:none"> The surfer</a>
			</h1>
		</div>
			
		<div id="user">
		
		<%
			if(request != null){
				if (request.isUserInRole("1")) 
					response.sendRedirect("./../admin/home.jsp");
				else if (request.isUserInRole("2")) 
					response.sendRedirect("./../poster/home.jsp");
				else{
					%>
					<a href="user/home.jsp" style ="text-decoration:none">Login</a>
					<a href="register/registerUserInformation.jsp" style ="text-decoration:none">Register new user</a>
					<%
				}
			}
		
		try{
			out.println("Welcome " + request.getUserPrincipal().getName());
			if (request.isUserInRole("3")) 
			 	out.println("(user)");
			else{
				//REDIRECT TILBAKE TIL INDEX MED WARNING
			}
		}catch(NullPointerException e){
			//REDIRECT TILBAKE TIL INDEX MED WARNING
		}	
			
		%>
		<p><a href="./../../../invalidate.jsp">Logout</a></p>
		
			
			
		</div>
		<div id="pages">
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">Beaches</a></li>
				<li><a href="#">Weather</a></li>
				<li><a href="#">Events</a></li>
				<li><a href="#">Media</a></li>
				<li><a href="#">Contact</a></li>
			
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
			<h2>News</h2>
			 <p> News about surfing </p>
			
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