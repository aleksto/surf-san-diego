<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
	<title>Add beaches</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	
</head>
<body>

<%
	if(session.getAttribute("theName")!=null && session.getAttribute("thePassword")!=null){
		String name = session.getAttribute("theName").toString();
		out.println("Name: " + name);
		String password = session.getAttribute("thePassword").toString();
		out.println("<br /> Password: " + password);
	} 
%> 

	<div id="wrapper">
		<div id="header">
			<div id= "head">
				<h1> <a href ="../sites/home/home.jsp" style ="text-decoration:none"> The surfer</a>
				</h1>
			</div>
				
			<div id="user">
				<form method="POST" action="j_security_check">
					<div id="username">
						Username:<input size="20" name="j_username" type="text"/><br/>
					</div>
					<div id="password">
						Password: <input size="20" name="j_password" type="password"/><br/>
					</div>
					
					<a href="../../register/registerUserInformation.jsp" style ="text-decoration:none">Register new user</a>
					<input type="submit" value="Login"/>
				</form> 
			</div>
			<div id="pages">
				<ul>
					<li><a href="#">Home</a></li>
					<li><a href="#">Beaches</a></li>
					<li><a href="#">Weather</a></li>
					<li><a href="#">Events</a></li>
					<li><a href="#">Media</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</div>
			<div style="clear:both"></div>
		</div>
		<div id="main-content">
			<div id="content-area">
				<h2>Register new beach</h2>
				
					<form name="frm" method="post" action="addBeach.jsp" onSubmit="return validateForm()">
						<p>	<table>
						<tr>			
							<td>Name:</td> 
							<td><input type="text" id="name" name="name" size=25 /></td>
						</tr>
						<tr>
							<td>Description:</td> 	
							<td>
								<textarea rows="8" cols="40"></textarea>
							</td>
							</tr>
					
						<tr>
							<td>City:</td> 	
							<td>	<select id="location">
										<option value="">Select city:</option>
										<option>San Diego</option>
						  				<option>LA</option>
										<option>Santa Barbara</option>
									</select>
							</td>
						</tr>
						
						<tr>
							<td>Area:</td> 	
							<td>	<select id="location">
										<option value="">Select area:</option>
										<option>south San Diego</option>
						  				<option>north San Diego</option>							
									</select>
							</td>
						</tr>
			
						<tr>
							<td>Picture: </td>	 
							<td>
								<button type="submit" value = "Select">Select picture</button>
								<button type="submit" value = "Upload">Upload</button>
							 </td>
						</tr>	
						
					</table>
							<p><button type="submit" value = "Submit">Submit</button> </p>
					</form>
					
			</div>
			<div id="sidebar">
				<h3>Something fun </h3>
			
			</div>
			<div style="clear:both"></div>
	</div>
	
	
	<div id="footer">
		<p> Copyright Ali, Maria, Ingrid. All Rights Reserved </p>
	</div>
</div>

</body>
</html>