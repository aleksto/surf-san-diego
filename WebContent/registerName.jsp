<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Register</title>
	<link href="./css/style.css" rel="stylesheet" type="text/css" />
	
	
	<script>
		function validateForm(){
		    if(document.getElementById("first_name").value==""){
		      alert("Please enter your first name");
		      document.frm.first_name.focus();
		      return false;
		    }
		    else if(document.getElementById("last_name").value==""){
		      alert("Please enter your last name");
		      document.frm.last_name.focus();
		      return false;
		    }
		    else if(document.getElementById("email").value==""){
			      alert("Please enter your email");
			      document.frm.last_name.focus();
			      return false;
			    }
		}
		
	</script>
	<script type="text/javascript">
		var monthtext=['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sept','Oct','Nov','Dec'];
		
		function populatedropdown(dayfield, monthfield, yearfield){
			var today=new Date()
			var dayfield=document.getElementById(dayfield)
			var monthfield=document.getElementById(monthfield)
			var yearfield=document.getElementById(yearfield)
			for (var i=0; i<32; i++)
				dayfield.options[i]=new Option(i, i+1)
				dayfield.options[today.getDate()]=new Option(today.getDate(), today.getDate(), true, true) 
			for (var m=0; m<12; m++)
				monthfield.options[m]=new Option(monthtext[m], monthtext[m])
				monthfield.options[today.getMonth()]=new Option(monthtext[today.getMonth()], monthtext[today.getMonth()], true, true) //select today's month
				var thisyear=today.getFullYear()
			for (var y=0; y<70; y++){
				yearfield.options[y]=new Option(thisyear, thisyear)
				thisyear-=1
			}
			yearfield.options[0]=new Option(today.getFullYear(), today.getFullYear(), true, true) 
			}
	
	</script>
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
				<h1> <a href ="index.jsp" style ="text-decoration:none"> The surfer</a>
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
					
					<a href="registerName.jsp" style ="text-decoration:none">Register new user</a>
					<input type="submit" value="Login"/>
				</form> 
			</div>
			<div id="pages">
				<ul>
					<li><a href="#">Home</a></li>
					<li><a href="#">Beaches</a></li>
					<li><a href="#">Weather</a></li>
					<li><a href="#">Events</a></li>
					<li><a href= "#">Media</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</div>
			<div style="clear:both"></div>
		</div>
		<div id="main-content">
			<div id="content-area">
				<h2>Fill in</h2>
				
					<form name="frm" method="post" action="registerAccountDetails.jsp" onSubmit="return validateForm()">
						<p>				
						First Name: <input type="text" id="first_name" name="first_name" size=25 /><br />
						Last Name: 	<input type="text" id="last_name"name="last_name" size=25 /><br /> 
						E-mail: 	<input type="text" id="email"name="email" size=25 /><br /> 
						Location: 	<select id="location">
										<option>San Diego</option>
				  						<option>LA</option>
				  						<option>Santa Barbara</option>
									</select>
								<br />
						Date of birth:<select id="daydropdown"> </select> 
									<select id="monthdropdown"> </select> 
									<select id="yeardropdown"></select>
									<br/>
	
						Skills: 	<select id="skills">
										<option value ="100"> Beginner</option>
										<option value ="101">Intermediate</option>
										<option value ="102">Professional</option>
								 	</select> <br /> 	
						</p>
						<p><input type="submit" value="Submit"> </p>
					</form>
			
					<script type="text/javascript">
					
						window.onload=function(){
						populatedropdown("daydropdown", "monthdropdown", "yeardropdown")
						}
					</script>
					
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

<%// if(skills == "102") {
	//	out.println("Hello world");
	//}	
%>
</body>
</html>
