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

	<%@ page import="java.util.ArrayList" %>
		<% 
		response.setContentType("text/xml");
		ArrayList surf_conditions =  (ArrayList) request.getAttribute("surf_conditions");  
	
		%>		
			<c:forEach var="surf_conditions" items="${ surf_conditions}">
			
			<table border="2">
			
			<tr>
	        <th colspan="4">${surf_conditions.getDate()} ${surf_conditions.getTime()} </th>
	        </tr>
			
	        <tr>
	        	<td>Wave size:</td>
	        	<td>Wave direction:</td>
	        	<td>Wind speed:</td>
	        	<td>Wind direction:</td>
	        </tr>
	       
	        <tr>
	        <td>${surf_conditions.getWave_size()}</td>
	        <td>${surf_conditions.getWave_dir()}</td>
	        <td>${surf_conditions.getWind_speed()}</td>
	        <td>${surf_conditions.getWind_dir()}</td>
	        </tr>
	        </table>
	        </c:forEach>
</body>
</html>
