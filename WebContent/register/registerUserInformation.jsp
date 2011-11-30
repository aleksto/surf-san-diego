<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Register</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	<script src="script.js" type="text/javascript"></script>
	
	<script>
		function validateForm(){
		    if(document.getElementById("firstname").value==""){
		      alert("Please enter your first name");
		      document.frm.firstname.focus();
		      return false;
		    }
		    else if(document.getElementById("lastname").value==""){
		      alert("Please enter your last name");
		      document.frm.lastname.focus();
		      return false;
		    }
		    else if(document.getElementById("email").value==""){
			      alert("Please enter your email");
			      document.frm.email.focus();
			      return false;
			}
		    else if(document.getElementById("location").value==""){
			      alert("Please enter your location");
			      document.frm.location.focus();
			      return false;
			}
		    else if(document.getElementById("daydropdown").value==""){
			      alert("Please enter your date of birth");
			      document.frm.daydropdown.focus();
			      return false;
			}
		    else if(document.getElementById("monthdropdown").value==""){
			      alert("Please enter your date of birth");
			      document.frm.monthdropdown.focus();
			      return false;
			}
		    else if(document.getElementById("yeardropdown").value==""){
			      alert("Please enter your date of birth");
			      document.frm.yeardropdown.focus();
			      return false;
			}
		    else if(document.getElementById("skill").value==""){
			      alert("Please enter your skill level");
			      document.frm.skill.focus();
			      return false;
			}
		    
		}
	</script>
	
	<script type="text/javascript">
		
		function populatedropdown(dayfield, monthfield, yearfield){
			var today=new Date();
			var dayfield=document.getElementById(dayfield);
			var monthfield=document.getElementById(monthfield);
			var yearfield=document.getElementById(yearfield);
			for (var i=1; i<32; i++)
				dayfield.options[i]=new Option(i, i+1);
				dayfield.options[today.getDate()]=new Option(today.getDate(), today.getDate(), true, true) ;
			for (var m=1; m<13; m++)
				monthfield.options[m]=new Option(m, m+1);
				monthfield.options[today.getMonth()]=new Option(today.getMonth(), today.getMonth(), true, true) ;
				var thisyear=today.getFullYear();
			for (var y=0; y<70; y++){
				yearfield.options[y]=new Option(thisyear, thisyear);
				thisyear-=1;
			}
			yearfield.options[0]=new Option(today.getFullYear(), today.getFullYear(), true, true) ;
			}
	
	</script>
	
	
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<div id="head">
				<h1> <a href ="../sites/home/home.jsp" style ="text-decoration:none"> The surfer</a>
				</h1>
			</div>
				
			<div id="user">
				<a href="./../sites/home/user/home.jsp" style ="text-decoration:none">Login</a>
				<a href="registerUserInformation.jsp" style ="text-decoration:none">Register new user</a>
			</div>
			
			<div id="pages">
				<ul>
					<li><a href="../sites/home/home.jsp">Home</a></li>
					<li><a href="../sites/beaches/beaches.jsp">Beaches</a></li>
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
				<h2>Fill in</h2>
					<form name="frm" method="post" action="registerAccountDetails.jsp" onSubmit="return validateForm()">
						<p>	<table tabindex="1">
						<tr>			
							<td>First Name:*</td> 
							<td><input type="text" id="firstname" name="firstname" size="25" /></td>
						</tr>
						<tr>
							<td>Last Name:*</td> 	
							<td><input type="text" id="lastname"name="lastname" size=25 /></td></tr>
						<tr>
							<td>E-mail:* </td>	
							<td><input type="text" id="email"name="email" size=25 /> </td></tr>
						<tr>
							<td>From State:*</td> 	
							<td>
								<input type="text" id="searchField" name="searchField" size=25 autocomplete="off" onkeyup="searchSuggest()" /> <br>
								<div id="popups"></div>
							</td>
						</tr>
						<tr>		
							<td>Date of birth:*</td>
							<td><select name="daydropdown" id="daydropdown"> </select> 
								<select name="monthdropdown" id="monthdropdown"> </select> 
								<select name="yeardropdown" id= "yeardropdown"></select>
							</td>
						</tr>
						<tr>
							<td>Skills:* </td>	 
							<td><select name="skill_id" id="skill"> 
									<option value="">Select skill:</option>
									<option value ="1"> Beginner</option>
									<option value ="2"> Intermediate</option>
									<option value ="3"> Professional</option>
							 	</select>
							 </td>
						</tr>	
					</table>
							<p><button type="submit" value = "Submit"> Submit</button> </p>
					</form>
			
					<script type="text/javascript">
					
						window.onload=function(){
							populatedropdown("daydropdown", "monthdropdown", "yeardropdown");
						};
					
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

