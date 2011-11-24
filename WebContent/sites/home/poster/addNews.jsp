<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<head>

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
			<a href="../user/home.jsp" style ="text-decoration:none">Login</a>
			<a href="../../../register/registerUserInformation.jsp" style ="text-decoration:none">Register new user</a>
		</div>
		<div id="pages">
			<ul>
				<li><a href="home.jsp">Home</a></li>
				<li><a href="beaches/addBeach.jsp">Beaches</a></li>
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
			
		<h2>News</h2>
			
			<form name="frm" method="post" action="commitNews.jsp" onSubmit="return validateForm()">
			
			<table>
				<tr>			
					<td>Headline:</td> 
					<td><input type="text" id="headline" name="headline" size=40 /></td>
				</tr>
				<tr>
					<td>Text:</td> 	
					<td> <textarea id="text" name="text" rows=20" cols="60"> </textarea></td>
				</tr>
				
				<tr>
				
				<%@ page import="java.sql.*" import="javax.naming.*" import="javax.sql.DataSource" import = "java.util.GregorianCalendar" %>
			
				<td>City:</td>
				<p><select name="id" > </p>
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
		    		<option value= "<%=index%>"><%=str%></option>
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
       </tr>
			
	</table>
			
			<p><input type="submit" value="Submit"></p>
			
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
