<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%
	if(request != null){
		if (request.isUserInRole("admin")) 
			response.sendRedirect("./../admin/beaches.jsp");
		else if (request.isUserInRole("poster")) { }	
		else if (request.isUserInRole("user")) 
			response.sendRedirect("./../user/beaches.jsp");
		else 
			response.sendRedirect("./../beaches.jsp");
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
				response.sendRedirect("./../beaches.jsp");
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
				<li><a href="./../../../index.jsp">Home</a></li>
				<li><a href="beaches.jsp">Beaches</a></li>
				<li><a href="#">Weather</a></li>
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
			<h2>Beaches</h2>
			<a href='showBeaches.do'>Link</a>
			<c:forEach var="beaches" items="${ beaches }">
	            <ul>
	                <li><b>${beaches.getName()}</b></li>
	                    <p>${beaches.getDescription()}</p>
	                    
	                   	<html:errors></html:errors>
				            <html:form method="post" action="/sites/beaches/poster/addEvaluation">
			               		<table>
									<tr>
									<td><html:hidden property="beachId" value="${beaches.getId()}"></html:hidden></td>			
									<td><html:text styleId="comment" property="comment" value="Write a comment..." size="25"> </html:text></td>
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
								<html:submit value="Submit"></html:submit>
			               	</html:form>
			               	
			               	<%
			               	int counter=0;
			               	boolean showMoreButton=false;
							%>
							<p>
			               	<c:forEach var="comment" items="${ beaches.getComments() }">
			               		<%if(counter<3){ %>
			               		_____________________________________________________________ <br>
			               		${ comment.getUserInfoModel().getFirstName()} ${ comment.getUserInfoModel().getLastName() } <br>
			               		 Rating: 
			               		 <c:forEach var="rating" items="${ beaches.getRatings() }">
			               		 	<c:if test="${ rating.getUserId() == comment.getUserInfoModel().getId() }">
			               		 		${rating.getRating()}
			               		 	</c:if>
 		
			               		 </c:forEach>  <br>
			               		 ${ comment.getComment() } 
			               		
			               		<% } 
			               		else if(counter==3){ showMoreButton=true; }
			               		counter++;%>
			               	</c:forEach>
			            	_____________________________________________________________</p>      	
			               	<p><% if(showMoreButton) out.println("Show all comments (IMPLEMENT!)"); %></p>
			               	
			               
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