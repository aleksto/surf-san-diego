<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%
	if(request != null){
		if (request.isUserInRole("admin")) 
			response.sendRedirect("admin/showBeaches.do");
		else if (request.isUserInRole("poster")) 
			response.sendRedirect("poster/showBeaches.do");
		else if (request.isUserInRole("user")) 
			response.sendRedirect("user/showBeaches.do");
	}
	%>	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>The surfer</title>
	<link href="./../../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div id="wrapper">
	<div id="header">
		<div id= "head">
			<h1> <a href ="./../home/showNews.do" style ="text-decoration:none"> The surfer</a>
			</h1>
		</div>
			
		<div id="user">
			<a href="user/showBeaches.do" style ="text-decoration:none">Login</a>
			<a href="../../register/registerUserInformation.jsp" style ="text-decoration:none">Register new user</a>
			
		</div>
		<div id="pages">
			<ul>
				<li><a href="./../home/showNews.do">Home</a></li>
				<li><a href="showBeaches.do">Beaches</a></li>
				<li><a href="./../surf_conditions/showBeaches.do">Weather</a></li>
			
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
			<h2>Beaches</h2>
			
			<c:forEach var="beaches" items="${ beaches }">
	            <ul>
	                <li>${beaches.getName()}</li>
	                    <p>${beaches.getDescription()}</p>
	                 	
	            </ul>
        	</c:forEach>
			
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