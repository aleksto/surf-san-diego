<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>The surfer</title>

</head>


	<%@ page import="java.sql.*" import="javax.naming.*" import="javax.sql.DataSource" import = "java.util.GregorianCalendar" %>

		<% 
	 	try {
      
      	Connection conn = null;
	   	Context context = new InitialContext();      
        DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Surf-San-DiegoDBPool");
        conn=ds.getConnection();
        String id = request.getParameter("id");
        Statement stmt = conn.createStatement();
        ResultSet rset = stmt.executeQuery("SELECT * FROM surf_conditions WHERE beach_id=" + id);
        %>	

			<%while(rset.next()) { %>
			<table border="2">
			<tr>
	        	<th colspan="4"><%=rset.getDate("dateSC") %> <%=rset.getTime("timeSC") %> </th>
	        </tr>
	        <tr>
	        	<td>Wave size:</td>
	        	<td>Wave direction:</td>
	        	<td>Wind speed:</td>
	        	<td>Wind direction:</td>
	        </tr>
	        <tr>
	        	<td><%=rset.getString("wave_size")%></td>
	        	<td><%=rset.getString("wave_direction")%></td>
	        	<td><%=rset.getString("wind_speed")%></td>
	        	<td><%=rset.getString("wind_direction")%></td>
	        </tr>
	        </table>
                      
       <%} %>
       
       
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
