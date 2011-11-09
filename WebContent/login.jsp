<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="POST" action="j_security_check">
		<div id="username">
			Username:<input size="20" name="j_username" type="text"/><br/>
		</div>
		<div id="password">
			Password: <input size="20" name="j_password" type="password"/><br/>
		</div>
		
		<a href="registerName.jsp">Register new user</a>
		<input type="submit" value="Login"/>
	</form> 
</body>
</html>