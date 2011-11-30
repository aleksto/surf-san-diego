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
			}
			
			xmlhttp.open("GET","getNews.jsp?id="+str,true);
			xmlhttp.send();
		}
			
	</script>
	<%
	if(request != null){
		if (request.isUserInRole("admin")) 
			response.sendRedirect("./../admin/home.jsp");
		else if (request.isUserInRole("poster")) 
			response.sendRedirect("./../poster/home.jsp");
		else if (request.isUserInRole("user")) { }	
		else 
			response.sendRedirect("./../home.jsp");
	}
	%>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>The surfer</title>
	<link href="./../../../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div id="wrapper">
	<div id="header">
		<div id= "head">
			<h1> <a href ="index.jsp" style ="text-decoration:none"> The surfer</a>
			</h1>
		</div>
			
		<div id="user">
		<%
		try{
			out.println("Welcome " + request.getUserPrincipal().getName());
			if (request.isUserInRole("user")) 
			 	out.println("(user)");
			else{
				//Add warning
				response.sendRedirect("./../home.jsp");
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
				<li><a href="home.jsp">Home</a></li>
				<li><a href="../../beaches/beaches.jsp">Beaches</a></li>
				<li><a href="../../surf_conditions/surf_con.jsp">Weather</a></li>
			
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
			<h3>Surf location </h3>
				<p> Set your surf location:  </p>
			
				<a href='showCity.do'>Show City</a>
				
				<form method="post" > 
					<select property = "city_id" onchange="showNews(this.value)" >
					
						<option value="none">Select city:</option>
						<c:forEach items="${city}" var="city">
				         	<c:set var="id" value="${city}" />
				             <option value="${city.getId()}">${city.getCity()}</option>
				         </c:forEach>
				     </select>
				    
				</form> 
		
		</div>
		<div style="clear:both"></div>
	</div>
	<div id="footer">
		<p> Copyright Ali, Maria, Ingrid. All Rights Reserved </p>
	</div>
</div>
</body>
</html>