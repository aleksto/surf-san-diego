<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>

	function validateForm(){
		if(document.frm.username.value==""){
			alert("Please enter you username");
			document.frm.username.focus();
			return false;
		}
		else if(document.frm.password.value==""){
	  		alert("Please enter your password");
	 		document.frm.password.focus();
	  		return false;
		}
		else if(document.frm.checkPassword.value==""){
			alert("Please re-enter your password");
			document.frm.password.focus();
			return false;
		}
		else if(document.frm.password.value != document.frm.checkPassword.value){
			alert("Your passwords did not match");
	 		document.frm.password.focus();
	  		return false;
		}
	}
</script>
</head>
<body>

<% 
	String firstName = request.getParameter("first_name");
	session.setAttribute("first_name", firstName); 
	String lastName = request.getParameter("last_name");
	session.setAttribute("last_name", lastName); 
	
	out.println(firstName + " " + lastName + ", please enter you account details");
%>	


	<form name="frm" method="post" action="registerCommit.jsp" onSubmit="return validateForm()">					
				Username: <input type="text" name="username" size=20 /><br />
				Enter password: <input type="password" name="password" size=20 /><br />
				Re-enter password: <input type="password" name="checkPassword" size=20 /><br />
				<input type="submit" value="Submit"><br />
	</form> 
</body>
</html>