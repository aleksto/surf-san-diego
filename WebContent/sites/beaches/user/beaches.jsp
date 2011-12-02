<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%
	if(request != null){
		if (request.isUserInRole("poster")) 
			response.sendRedirect("./../poster/showBeaches.do");
		else if (request.isUserInRole("user")) { }
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
		<div id= "head">
			<h1> <a href ="./../../home/poster/showNews.do" style ="text-decoration:none"> The surfer</a>
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
				<li><a href="./../../home/user/showCity.do">Home</a></li>				<li><a href="./../../home/user/showCity.do">Home</a></li>
				<li><a href="showBeaches.do">Beaches</a></li>
				<li><a href="../../../sites/surf_conditions/showBeaches.do">Weather</a></li>
			
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
			<c:forEach var="beaches" items="${beaches}">
	            <ul>
	                <li><b>${beaches.getName()}</b></li>
	                    <p>${beaches.getDescription()}</p>
	                    
				            <html:form method="post" action="/sites/beaches/user/addEvaluation">
			               		<table>
									<tr>
									<td><html:hidden property="beachId" value="${beaches.getId()}"></html:hidden></td>			
									<td><html:hidden property="username" value="<%= request.getUserPrincipal().getName() %>"></html:hidden></td>			
									<td><html:text styleId="comment" property="comment" value="Write a review..." size="25"> </html:text></td>
									<td>	
									<html:select styleId="rating" property="rating">
										<html:option value="0">Rate beach:</html:option>
										<html:option value="1">*</html:option>
										<html:option value="2">**</html:option>
										<html:option value="3">***</html:option>
							 		</html:select>
									</td>
									</tr>
								</table>
								<!--<html:submit value="Submit"></html:submit>-->
								<p>								
								<html:submit property="action" value="insert">
								</html:submit>
								</p>
			               	</html:form>
			               	</ul>
			               
						
							
						
						<p>
								
				               	<c:forEach var="comment" items="${ beaches.getComments() }">
				               		<c:set var="rating" value="${beaches.getRatings()}" />
				         -------------------------------------------------------------------------------------<br>
				               		Username: ${ comment.getUsername() }<br>
				               	
				               		Comment: ${ comment.getComment() }<br>
				               		
				               		
				               				 				               
				               	</c:forEach>
				         -------------------------------------------------------------------------------------<br>
				               	
				               	</c:forEach>
				               

							
							</p>		

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