<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>



<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>NettsideFirmaNavn - Vi er gode til slagord!</title>
	
	<link href="./css/style.css" rel="stylesheet" type="text/css" />
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
		
	
		<h1><a href=""> NettsideFirmaNavn - Vi er gode til slagord! </a></h1>
		

		<div id="user">
			<form method="POST" action="j_security_check">
				<div id="username">
					Username:<input size="20" name="j_username" type="text"/><br/>
				</div>
				<div id="password">
					Password: <input size="20" name="j_password" type="password"/><br/>
				</div>
				
				<a href="registerName.jsp">Register new user</a>
				<input type="submit" value="Login"/>
			</form> 
		</div>
		<div id="pages">
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">Beaches</a></li>
				<li><a href="#">Weather</a></li>
				<li><a href="#">Events</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
		</div>
		<div style="clear:both"></div>
	</div>
	<div id="main-content">
		<div id="content-area">
			<div id="top-photo">
				<div id="photo-caption">
				<p>&raquo; Dette er et salgsargument til bildet nedenfor...
				</p></div>
			</div>
			<h2>Velkommen til v�r hjemmeside...</h2>
			 <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sodales lectus nec neque euismod euismod. Nunc dapibus mauris laoreet est vestibulum sit amet iaculis purus consequat. Aenean vel lorem erat, eget luctus velit. Nam ante mi, mattis nec placerat at, rhoncus a sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>

<p>
Nulla molestie facilisis tincidunt. Fusce vel lectus ante. Fusce suscipit condimentum purus porttitor porta. Morbi rhoncus nisi in quam imperdiet consectetur. Vestibulum in felis ac risus venenatis convallis. Aenean non mollis est. Vestibulum metus risus, tempus sed ultricies quis, pulvinar et neque.
</p>

<p>
Donec dignissim aliquet enim, sed auctor ipsum luctus a. Donec suscipit lobortis sapien, at vehicula eros imperdiet bibendum. Pellentesque consectetur facilisis lectus vel aliquet. Curabitur congue dignissim ligula sed luctus. Donec euismod convallis bibendum. Suspendisse potenti. Nam dui sapien, sagittis et lobortis id, aliquet sit amet erat. Quisque ipsum urna, dapibus ut eleifend id, consequat eget leo. Morbi nec ipsum vel metus varius facilisis et eget libero. Suspendisse at dolor arcu, in placerat magna. Nullam sit amet neque lacus, vel pellentesque nisl. Maecenas vestibulum feugiat tempus. Nullam risus arcu, suscipit in blandit et, fringilla et mauris. Donec egestas scelerisque nibh nec elementum. Donec sed vulputate nunc. Suspendisse congue tristique lorem sit amet lacinia. Nulla felis dolor, condimentum ac laoreet vitae, mattis eu nibh.
</p> 
			
		</div>
		<div id="sidebar">
			<h3>Om oss... </h3>
			<p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sodales lectus nec neque euismod euismod. Nunc dapibus mauris laoreet est vesti-
			</p>
			<p><a href="#" class="readmore">Fortsett � les...</a></p>
			
			<img src="#" alt="Image" class="border" />
			
			<h3>Linker</h3>
			<ul>
				<li>Link1</li> 
				<li>Link2</li>
				<li>Link3</li>
				<li>Link4</li>
				<li>Link5</li>
			</ul>
		</div>
		<div style="clear:both"></div>
	</div>
	<div id="footer">
		<p> Copyright � 2011 Website Company Name. All Rights Reserved </p>
	</div>
</div>
</body>
</html>
