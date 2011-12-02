<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<title>Add news</title>
	<link href="./../../../css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="wrapper">
	<div id="header">
		<div id="head">
			<h1> <a href ="home.jsp" style ="text-decoration:none"> The surfer</a>
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
				<li><a href="../../beaches/poster/showBeaches.do">Beaches</a></li>
				<li><a href="../../surf_conditions/poster/showBeaches.do">Weather</a></li>
			
			</ul>
		</div>
		<div style="clear:both"></div>
	</div>
	<div id="main-content">
		<div id="content-area">
		
		<h2>News</h2>
			<html:errors></html:errors>
		          <html:form method="post" action="/sites/home/poster/addNews">
		           		<table>
		           		
		           			<td>City:</td>
		           			
		           				<html:select styleId="city_id" property="city_id">
										<html:option value="none">Select city:</html:option>
											<c:forEach items="${city}" var="city">
				                				<c:set var="id" value="${city}" />
				                				<html:option value="${city.getId()}">${city.getCity()}</html:option>
				            			</c:forEach>
				            	</html:select>

		           			<tr>
		           										
								<td> Headline: </td> 
								 <td ><html:text styleId="headline" property="headline" value="" size="25"> </html:text></td>
							</tr>
							<tr>
								<td> Text: </td>
								<td ><html:textarea styleId="text" property="text" value="" cols="40" rows="5"> </html:textarea></td>	
						</table>
								<html:submit value="Submit"></html:submit>
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
