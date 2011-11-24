<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
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

			<h2>News</h2>
			<a href='showNews.do'>Show News</a>
			
            <c:forEach var="news" items="${ news }">
            <ul>
                <li>  ${news.getTitle()} </li>
                    <p>${news.getText()}</p>
                    <p> ${news.getTimestamp()}</p>
            </ul>        
        	</c:forEach>
		 
		</div>
		
		<div id="sidebar">
			<h3>Surf location </h3>
				<%@ page import="java.sql.*" import="javax.naming.*" import="javax.sql.DataSource" import = "java.util.GregorianCalendar" %>
				<form name="frm" method="post" action="home.jsp" onSubmit="return validateForm()">
				
				<p>Choose your surf location and get news.  </p>
				<p><select name='city' onchange="city(this.value)"> </p> 
		       	<option value="none">Select city: </option> 
			<% 	
			try {
		    	/*
		    	Class.forName("org.gjt.mm.mysql.Driver");
		        conn =
		           DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=root&" +
		                                       "user=root&password=pothead");
		       */
		       Connection conn = null;
		       
				Context context = new InitialContext();      
				DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Surf-San-DiegoDBPool");
				conn=ds.getConnection();  
		       	
				PreparedStatement pstmt = null;
				ResultSet updateQuery = null;
				pstmt = conn.prepareStatement("SELECT city, id FROM city");
				updateQuery = pstmt.executeQuery();
				int index = 0;
				while(updateQuery.next()){
					 String str=updateQuery.getString("city");
					 index =updateQuery.getInt("id");
				%>
		    		<option value="<%=index%>"><%=str%></option>
		    	<%
				}
				%>
				</select>
				 <%
			pstmt.close();
			conn.close(); 
		}
		catch (Exception e) {
    	e.printStackTrace();
   		} 
       %>
       <p><input type="submit" value="Submit"></p>
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