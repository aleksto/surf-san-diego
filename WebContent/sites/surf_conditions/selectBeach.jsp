<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%

	%>	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>The surfer</title>
	<link href="./../../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	

<div id="wrapper">
	<div id="header">
		<div id="head">
			<h1> <a href ="home.jsp" style ="text-decoration:none"> The surfer</a>
			</h1>
		</div>
			
		<div id="user">
			<a href="user/home.jsp" style ="text-decoration:none">Login</a>
			<a href="../../register/registerUserInformation.jsp" style ="text-decoration:none">Register new user</a>
		</div>
		<div id="pages">
			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li><a href="../beaches/beaches.jsp">Beaches</a></li>
				<li><a href="../surf_conditions/showBeaches.do">Weather</a></li>
			
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
			<h2>Surfing conditions</h2>
				
			<form action="">	
				<select>
					<option value="0">Select beach:</option>
					<c:forEach var="beaches" items="${ beaches }">
						<option value="${beaches.getId()}">${beaches.getName()}</option> 			  	
        			</c:forEach>
				</select>
			</form>	      
			
			
			<c:forEach var="beaches" items="${ beaches }"> 
		 
			<h3>${beaches.getName()}</h3>
				
				<c:forEach var="surfCons" items="${beaches.getSurfCons()}">
	            <table border = "2">
	            <tr>
	            	<th colspan = "4"> ${surfCons.getDate()}   ${surfCons.getTime()}</th>
	            </tr>
	            <tr>
	           		<td>Wave size:</td>
	           		<td>Wave direction:</td>
	           		<td>Wind speed:</td>
	           		<td>Wind direction:</td>
	           	</tr>
	           	<tr>
	           		<td>${surfCons.getWave_size()}</td>
	           		<td>${surfCons.getWave_dir()}</td>
	           		<td>${surfCons.getWind_speed()}</td>
	           		<td>${surfCons.getWind_dir()}</td>
	           	</tr>
	            </table>
	            </c:forEach>	
	   
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