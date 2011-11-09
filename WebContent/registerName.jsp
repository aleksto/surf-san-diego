<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
	function validateForm(){
	    if(document.getElementById("first_name").value==""){
	      alert("Please enter your first name");
	      document.frm.first_name.focus();
	      return false;
	    }
	    else if(document.getElementById("last_name")==""){
	      alert("Please enter your last name");
	      document.frm.last_name.focus();
	      return false;
	    }
	}
</script>
</head>
<body><table><tr>
<td>
	<form name="frm" method="post" action="registerAccountDetails.jsp" onSubmit="return validateForm()">					
				First Name: <input type="text" id="first_name" name="first_name" size=20 /><br />
				Last Name: <input type="text" id="last_name"name="last_name" size=20 /><br />
				
				<input type="submit" value="Submit"><br />
	</form> 

</td>
</tr></table></body>
</html>