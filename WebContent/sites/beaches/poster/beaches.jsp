<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	                <li>${beaches.getName()}</li>
	                    <p>${beaches.getDescription()}</p>
				            <form form name="frm" method="post" action="addComment.jsp">
			               		<table>
									<tr>	
									<td><input type="hidden" id="id" name="id" value="${beaches.getId()}" size=25 /></td>			
									<td><input type="text" id="comment" name="comment" value="Write a comment..." size=25 /></td>
									<td>	
									<select name="rate">
										<option id ="">Rate beach:</option>
										<option id ="1"> *</option>
										<option id ="2"> **</option>
										<option id ="3"> ***</option>
										
							 		</select>
								</td>
									</tr>
								</table>
								<input type="submit" value="Post">
			               	</form>
			        </ul>
			</c:forEach>
			
			
            <tr>
                <td>
                   <form action="response.jsp">
                        <strong>Select city:</strong>
                        <select name="city_id">
                            <option></option>
                        </select>
                        <input type="submit" value="submit" name="submit" />
                    </form>
                 </td>  
            </tr>
            
           
		    <!--  
			 <p>			
				<td>Comment:</td> 
					<td><textarea rows="3" cols="30"></textarea></td>
				
				<td>	
					<select id="location">
						<option value="">Rate beach:</option>
						<option>*</option>
						<option>**</option>
						<option>***</option>
			 		</select>
				</td>
             </p>
			-->
			
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