<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Register</title>
	<link href="../../css/style.css" rel="stylesheet" type="text/css" />
	
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<div id= "head">
				<h1> <a href ="./../../sites/home/user/showNews.do" style ="text-decoration:none"> The surfer</a>
				</h1>
			</div>
				
			<div id="user">
				<a href="./../../sites/home/user/showNews.do" style ="text-decoration:none">Login</a>
				<!--  <a href="registerUserInformation.jsp" style ="text-decoration:none">Register new user</a> -->
			</div>
			
			<div id="pages">
				
			</div>
			<div style="clear:both"></div>
		</div>
		<div id="main-content">
			<div id="content-area">
				<h2>Registration successful</h2>
            <ul>
                First Name: ${userInfo.getFirstName()} <br>
                Last Name: ${userInfo.getLastName()} <br>
                E-mail: ${userInfo.getEmail()} <br>
                Location: ${userInfo.getLocation()} <br>
                Skill: ${userInfo.getSkill()} <br> 
                Date: ${userInfo.getDate()}  <br>
            </ul>        
			
			<p> 
			<a href="./../../sites/home/user/showNews.do" style ="text-decoration:none"> <br> Proceed to login</a> </p>

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
