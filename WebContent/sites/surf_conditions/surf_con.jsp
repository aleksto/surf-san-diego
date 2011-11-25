<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<li><a href="../surf_conditions/surf_con.jsp">Weather</a></li>
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
			<h2>Surfing conditions</h2>
				
			<a href='selectBeach.do'>Show beach selection</a>
			<c:forEach var="beaches" items="${ beaches }">
					<li>${beaches.getId()}</li>
	                    <p>${beaches.getName()}</p>
			</c:forEach>
				
			<a href='showSurfCon.do'>Show surfing conditions</a>	
			<c:forEach var="surf_conditions" items="${ surf_conditions }">
   
            <table border = "4">
            <tr>
            	<th colspan = "4">${surf_conditions.getDate()}   ${surf_conditions.getTime()}</th>	
            </tr>
            <tr>
           		<td>Wave size:</td>
           		<td>Wave direction:</td>
           		<td>Wind speed:</td>
           		<td>Wind direction:</td>
           	</tr>
           	<tr>
           		<td>${surf_conditions.getWave_size()}</td>
           		<td>${surf_conditions.getWave_dir()}</td>
           		<td>${surf_conditions.getWind_speed()}</td>
           		<td>${surf_conditions.getWind_dir()}</td>
           	</tr>
            </table>
          
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