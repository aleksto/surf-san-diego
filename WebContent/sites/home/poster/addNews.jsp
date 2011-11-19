<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add news</title>
</head>
<body>

	<form name="frm" method="post" action="registerAccountDetails.jsp" onSubmit="return validateForm()">
		<p>	
			<table>
				<tr>			
					<td>Headline:</td> 
					<td><input type="text" id="headline" name="headline" size=40 /></td>
				</tr>
				<tr>
					<td>Text:</td> 	
					<td> <textarea id="text" name="headlines" rows=20" cols="100"> </textarea></td>
				</tr>
		
</body>
</html>