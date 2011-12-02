<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>The surfer</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script src="script.js" type="text/javascript"></script>
</head>

<body>

<div id="wrapper">
	<div id="header">
		<div id= "head">
			<h1> <a href ="../sites/home/showNews.do" style ="text-decoration:none"> The surfer</a>
			
			
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
				else if(document.frm.password.value.length < 5){
			  		alert("Your password should be atleast 5 characters");
			 		document.frm.password.focus();
			  		return false;
				}
			 
			    else if(document.getElementById("checkPassword").value==""){
					alert("Please re-enter your password");
					document.frm.password.focus();
					return false;
				}
			 }
			</script>
			
			</h1>
		</div>
			
		<div id="user">
			<a href="./../sites/home/user/home.jsp" style ="text-decoration:none">Login</a>
			<a href="registerUserInformation.jsp" style ="text-decoration:none">Register new user</a>
		</div>
		<div id="pages">
			<ul>
				<li><a href="../sites/home/showNews.do">Home</a></li>
				<li><a href="../sites/beaches/showBeaches.do"">Beaches</a></li>
				<li><a href="../sites/surf_conditions/showBeaches.do"">Weather</a></li>
				
			
			</ul>
		</div>
		<div style="clear:both"></div>
	</div>
	<div id="main-content">
		<div id="content-area">
			<h2>Fill in</h2>
			 <p> 
			<% 
			String firstName = request.getParameter("firstname");
			session.setAttribute("firstname", firstName); 
			String lastName = request.getParameter("lastname");
			session.setAttribute("lastname", lastName); 
			String email = request.getParameter("email");
			session.setAttribute("email", email); 
			String location = request.getParameter("location");
			session.setAttribute("location", location); 
			String day = request.getParameter("daydropdown");
			session.setAttribute("day", day); 
			String month = request.getParameter("monthdropdown");
			session.setAttribute("month", month); 
			String year = request.getParameter("yeardropdown");
			session.setAttribute("year", year);
			String skill = request.getParameter("skill_id");
			session.setAttribute("skill", skill); 
			
			%>	
			</p>
		
			<html:form method="post" action="/register/addUser" onsubmit="return validateForm()">				
				<p>	
				<table>
				<html:hidden property="firstName" value="<%=firstName%>"></html:hidden>
				<html:hidden property="lastname" value="<%=lastName%>"></html:hidden>			
				<html:hidden property="email" value="<%=email%>"></html:hidden>			
				<html:hidden property="location" value="<%=location%>"></html:hidden>			
				<html:hidden property="day" value="<%=day%>"></html:hidden>			
				<html:hidden property="month" value="<%=month%>"></html:hidden>			
				<html:hidden property="year" value="<%=year%>"></html:hidden>			
				<html:hidden property="skill" value="<%=skill%>"></html:hidden>			
							
					<tr>	
						<td>Username:</td> 
						<td><html:text property="username" size="20"></html:text></td>
					</tr>
					
					<tr>
						<td>Enter password:</td> 
						<td>
							<html:password property="password" styleId="password" size="20" onkeyup="validatePassword()"></html:password>
							<div id="errorMessage"></div>
							
						</td>
					</tr>
					<tr>
						<td>Re-enter password: </td>
						<td><html:password property="checkPassword" size="20"></html:password></td>
					</tr>
				</table>
				
			<p><html:submit value="Submit"></html:submit></p>
			</html:form>
			
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
