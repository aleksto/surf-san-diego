<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>The surfer</title>
	<link href=../css/style.css" rel="stylesheet" type="text/css" />
	
		<script>
			function validateForm(){
			    if(document.getElementById("username").value==""){
					alert("Please enter you username");
					document.frm.username.focus();
					return false;
				}
				else if(document.frm.password.value==""){
			  		alert("Please enter your password");
			 		document.frm.password.focus();
			  		return false;
				}
			    else if(document.getElementById("checkPassword").value==""){
					alert("Please re-enter your password");
					document.frm.password.focus();
					return false;
				}
			    if(document.getElementById("password") != document.getElementById("checkPassword")){
					alert("Your passwords did not match");
			 		document.frm.password.focus();
			  		return false;
				}
			}
		</script>
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
			<form method="POST" action="j_security_check">
				<div id="username">
					Username:<input size="20" name="j_username" type="text"/><br/>
				</div>
				<div id="password">
					Password: <input size="20" name="j_password" type="password"/><br/>
				</div>
				
				<a href="registerUserInformation.jsp" style ="text-decoration:none">Register new user</a>
				<input type="submit" value="Login"/>
			</form> 
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
			<h2>Fill in</h2>
			 <p> 
			<% 
			String firstName = request.getParameter("first_name");
			session.setAttribute("first_name", firstName); 
			String lastName = request.getParameter("last_name");
			session.setAttribute("last_name", lastName); 
			
			out.println(firstName + " " + lastName + ", please enter you account details");
			%>	
			</p>
		
			<form name="frm" method="post" action="registerCommit.jsp" onSubmit="return validateForm()">
				<p>					
				Username: <input type="text" id="username" name="username" size=20 /><br />
				Enter password: <input type="password" id=password" name="password" size=20 /><br />
				Re-enter password: <input type="password" id="checkPassword" name="checkPassword" size=20 /><br />
				<input type="submit" value="Submit"><br />
				</p>
			</form>  
			
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
