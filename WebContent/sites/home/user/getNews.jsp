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
	<%@ page import="java.util.ArrayList" %>
       <% 
       response.setContentType("text/xml");
       ArrayList news =  (ArrayList) request.getAttribute("news");  
   
       %>
	

			<c:forEach var="news" items="${ news }">
            <ul>
                <li>  ${news.getHeadline()} </li>
                    <p>${news.getText()}</p>
                    <p> ${news.getTimestamp()}</p>
            </ul>           
        	</c:forEach>
	

	 	<!--  <a href='showFilterNews.do'>Show News</a>
				 
	            <c:forEach var="news" items="${ news }">
	            <ul>
	                <li>  ${news.getHeadline()} </li>
	                    <p>${news.getText()}</p>
	                    <p> ${news.getTimestamp()}</p>
	            </ul>        
	        </c:forEach> 
-->
</body>
</html>