<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

		<script type="text/javascript">
		function showSurfCon(str)
		{
		var xmlhttp;  
		if (str=="")
		  {
		  document.getElementById("surf_conditions").innerHTML="";
		  return;
		  }
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		xmlhttp.onreadystatechange=function()
		  {
		  if (xmlhttp.readyState==4 && xmlhttp.status==200)
		    {
		    document.getElementById("surf_conditions").innerHTML=xmlhttp.responseText;
		    }
		  }
		xmlhttp.open("GET","showSurfCon.do?id="+str,true);
		xmlhttp.send();
		}
		
		</script>
		<%
		if(request != null){
			if (request.isUserInRole("poster")) { }
			else if (request.isUserInRole("user")) 
				response.sendRedirect("./../user/showBeaches.do");
			else
				response.sendRedirect("./../showBeaches.do");
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
			<h1> <a href ="../../home/showNews.do" style ="text-decoration:none"> The surfer</a>
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
				response.sendRedirect("./../showBeaches.do");
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
				<li><a href="../../home/showNews.do">Home</a></li>
				<li><a href="../../beaches/showBeaches.do">Beaches</a></li>
				<li><a href="showBeaches.do">Weather</a></li>
			
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
				
			<form>	
				<select property="beach_id" name="surf_conditions" onchange="showSurfCon(this.value)">
					<option value="none">Select beach:</option>
					<c:forEach var="beaches" items="${ beaches }">
						<c:set var="id" value="${ beaches }" />
						<option value="${beaches.getId()}">${beaches.getName()}</option> 			  	
        			</c:forEach>
				</select>
			</form>	 
			
			<div id="surf_conditions"></div>             	
				
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