<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		response.setContentType("text/xml");
		// Get the only row in the student row set
		RowSet commentSet = (RowSet) request.getAttribute("commentSet");
		commentSet.next();
	%>
	<html:html xhtml="true">
		<tr id="comment-<%=commentSet.getInt("id")%>">
		<html:form action="/updateEvaluation">
		<%--Get the id, which is a number --%>
		<td>
		<input type="hidden" name="id" value="<%=commentSet.getInt("id")%>" />
		<%=commentSet.getInt("id")%>
		</td>
		</html:form>
		</tr>
	</html:html>

</body>
</html>