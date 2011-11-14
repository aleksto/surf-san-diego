<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<script type="text/javascript">
		function loadXMLDoc() {

		var xmlHttp=new XMLHttpRequest();
		
		if (window.XMLHttpRequest)
		  {// code for IE7+, Firefox, Chrome, Opera, Safari
		  xmlhttp=new XMLHttpRequest();
		  }
		else
		  {// code for IE6, IE5
		  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		  }
		
		xmlhttp.onreadystatechange=function() {
		  
			if (xmlhttp.readyState==4 && xmlhttp.status==200)	{
			    document.getElementById("myDiv").innerHTML=xmlhttp.responseText;
			}
		}
		xmlhttp.open("GET","tester.xml",true);
		xmlhttp.send();
		
		}
	</script>
	
</head>
<body>
<h2>Skills:</h2>

<form name="frm" method="post" action="registerAccountDetails.jsp" onSubmit="return validateForm()">
<select name="skills" onchange="loadXML(this.value)">
	
		<option value ="100"> Beginner</option>
		<option value ="101">Intermediate</option>
		<option value ="102">Professional</option>
	</select>	
	<div id="myDiv"></div>
	
</form>
	<button type="button" onclick="loadXMLDoc()">Submit</button>
						

</body>
</html>