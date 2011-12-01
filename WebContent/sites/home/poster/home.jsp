<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%
	if(request != null){
		if (request.isUserInRole("admin")) 
			response.sendRedirect("./../admin/showNews.do");
		else if (request.isUserInRole("poster")) { }	
		else if (request.isUserInRole("user")) 
			response.sendRedirect("./../user/showNews.do");
		else 
			response.sendRedirect("./../showNews.do");
	}
	%>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>The surfer</title>
	<link href="./../../../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	
<div id="wrapper">
	<div id="header">
		<div id="head">
			<h1> <a href ="showNews.do" style ="text-decoration:none"> The surfer</a>
			</h1>
		</div>
			
		<div id="user">
		
		<% 
		try{
			out.println("Welcome " + request.getUserPrincipal().getName());
			if (request.isUserInRole("poster")) 
			 	out.println("(poster)");
			else{
				//Add warning
				response.sendRedirect("./../showNews.do");
			}
		}catch(NullPointerException e){
			//Add warning
			response.sendRedirect("./../showNews.do");
		}	
		%>
		
		<p><a href="./../../../invalidate.jsp">Logout</a></p>
		</div>
		
		<div id="pages">
			<ul>
				<li><a href="showNews.do">Home</a></li>
				<li><a href="../../beaches/showBeaches.do">Beaches</a></li>
				<li><a href="../../surf_conditions/showBeaches.do">Weather</a></li>
			
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
			
			<form name="frm" method="post" action="showCity.do" >
			 	<p><button type="submit" value = "Submit">Add news</button> </p>
			 </form>
			
			 <c:forEach var="news" items="${ news }">
            <ul>
                <li>  ${news.getHeadline()} </li>
                    <p>${news.getText()}</p>
                    <p> ${news.getTimestamp()}</p>
            </ul>           
        	</c:forEach>

			 <form name="frm" method="post" action="showCity.do" >
			 	
			 	<p><button type="submit" value = "Submit">Add news</button> </p>
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
