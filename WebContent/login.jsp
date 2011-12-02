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
			<h1> <a href ="#" style ="text-decoration:none"> The surfer</a>
			</h1>
		</div>
			
		<div id="user">
			<a href="../showCity.do" style ="text-decoration:none">Login</a>
			<a href="../../../register/registerUserInformation.jsp" style ="text-decoration:none">Register new user</a>
		</div>
		<div id="pages">
			<ul>
				<li><a href="../../../sites/home/showNews.do">Home</a></li>
				<li><a href="../../../sites/beaches/showBeaches.do">Beaches</a></li>
				<li><a href="../../../sites/surf_conditions/showBeaches.do">Weather</a></li>
			
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
			 <p> Please login to continue </p>
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
