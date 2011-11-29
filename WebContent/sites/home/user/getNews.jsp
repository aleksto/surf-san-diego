<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%@ page import="java.sql.*" import="javax.naming.*" import="javax.sql.DataSource" import = "java.util.GregorianCalendar" %>
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
        
        Statement stmt = conn.createStatement();
        ResultSet rset = stmt.executeQuery("SELECT headline, text, newsDate FROM news");
        %>
			<table>

				<% while ( rset.next() ) { %>

					<ul>
					<li><%=rset.getString("headline") %></li> </ul>

					<p><%=rset.getString("text")%></p> 
					
					<p><%=rset.getTimestamp("newsDate")%></p> 
					
			<% } %>
			</table>
		<% 
   
       	rset.close();
        conn.commit();
        conn.close();
        
	}
	catch (Exception e)	{
    	e.printStackTrace();
    }  
	%>

</body>
</html>