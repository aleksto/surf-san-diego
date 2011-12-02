<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	
		<script type="text/javascript">
		function showNews(str)	{
			
			var xmlhttp;    
			if (str=="")	{
			  	document.getElementById("news").innerHTML="";
			  	return;
			}
			if (window.XMLHttpRequest)	{// code for IE7+, Firefox, Chrome, Opera, Safari
			  	xmlhttp=new XMLHttpRequest();
			}
			else	 {// code for IE6, IE5
			  	xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange=function()	 {
			  	if (xmlhttp.readyState==4 && xmlhttp.status==200)	{
			    	document.getElementById("news").innerHTML=xmlhttp.responseText;
			    }
			};
			
			var username="<%=request.getUserPrincipal().getName()%>"; 
			xmlhttp.open("GET","showNews.do?id="+str+"&username="+username,true);
			xmlhttp.send();
		}
			
	</script>
	<%
	if(request != null){
		if (request.isUserInRole("poster")) 
			response.sendRedirect("./../poster/showNews.do");
		else if (request.isUserInRole("user")) { 
		}	
		else 
			response.sendRedirect("./../showNews.do");
	}
	%>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>The surfer</title>
	<link href="./../../../css/style.css" rel="stylesheet" type="text/css" />
</head>

<%@ page import="java.util.ArrayList" %>
<% 
       response.setContentType("text/html");
       ArrayList city = (ArrayList) request.getAttribute("city"); 
		if(city.size()>1){
			response.sendRedirect("showCity.do?username="+request.getUserPrincipal().getName());
		}

       response.setContentType("text/html");
       ArrayList news = (ArrayList) request.getAttribute("news");  
%>

<c:forEach items="${city}" var="city">
	<body onLoad="showNews(${city.getId()})">
</c:forEach>

<div id="wrapper">
	<div id="header">
		<div id= "head">
			<h1> <a href ="showCity.do" style ="text-decoration:none"> The surfer</a>
			</h1>
		</div>
			
		<div id="user">
		<%
		try{
			out.println("Welcome " + request.getUserPrincipal().getName());
			if (request.isUserInRole("user")) 
			 	out.println("(user)");
			
			else if (request.isUserInRole("poster")) 
			 	out.println("(poster)");
			else{
				//Add warning
				response.sendRedirect("../home.jsp");
			}
		}catch(NullPointerException e){
			//Add warning
			response.sendRedirect("./../home.jsp");
		}		
		%>
		<p><a href="./../../../invalidate.jsp">Logout</a></p>	
		</div>
		
		<div id="pages">
			<ul>
				<li><a href="showCity.do">Home</a></li>
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

				<div id="news"></div>	
				
		</div>
		
		<div id="sidebar">
			<% String username = request.getUserPrincipal().getName(); %>
			<h3>Surf location </h3>
				<p> Set your surf location:  </p>
			
				<html:form method="post" action="/sites/home/user/addCity"> 
					<p>
					<table>
						<html:hidden property="username" value="<%= username %>"></html:hidden>
						<html:select styleId="city_id" property = "city_id" onchange="showNews(this.value)"  >
							
							<html:option value="0">Select city:</html:option>
								<c:forEach items="${cities}" var="cities">
					         		<c:set var="id" value="${cities.getCity()}" />
					            	 <html:option value="${cities.getId()}">${cities.getCity()}</html:option>
					         	</c:forEach>
					    </html:select>
					 </table>
					 </p>
					<p><html:submit value="Submit"></html:submit></p>
				</html:form> 
		
		</div>
		<div style="clear:both"></div>
	</div>
	<div id="footer">
		<p> Copyright Ali, Maria, Ingrid. All Rights Reserved </p>
	</div>
</div>
</body>
</html>