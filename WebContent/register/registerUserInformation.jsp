<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>Register</title>
	<link href="../css/style.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript">

		function showSkills(str) {
			var xmlHttp = new XMLHttpRequest();
			var url="getSkills.jsp";
			url = url + "?q=" + str;
			url = url + "&sid=" + Math.random();
			xmlHttp.onreadystatechange = stateChanged;
			xmlHttp.open("GET", url, true);
			xmlHttp.send(null);

  
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			  xmlhttp=new XMLHttpRequest();
			}
			else {// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange=function()	{
			  if (xmlhttp.readyState==4 && xmlhttp.status==200)	{
			   
			  }
			}
		}
			
		
		
	</script>
	
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
			var today=new Date();
			var dayfield=document.getElementById(dayfield);
			var monthfield=document.getElementById(monthfield);
			var yearfield=document.getElementById(yearfield);
			for (var i=0; i<32; i++)
				dayfield.options[i]=new Option(i, i+1);
				dayfield.options[today.getDate()]=new Option(today.getDate(), today.getDate(), true, true) ;
			for (var m=0; m<12; m++)
				monthfield.options[m]=new Option(monthtext[m], monthtext[m]);
				monthfield.options[today.getMonth()]=new Option(monthtext[today.getMonth()], monthtext[today.getMonth()], true, true);
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
					
					<a href="registerUserInformation.jsp" style ="text-decoration:none">Register new user</a>
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
				<h2>Fill in</h2>
		
				
					<form name="frm" method="post" action="registerAccountDetails.jsp" onSubmit="return validateForm()">
						<p>	<table>
						<tr>			
							<td>First Name:*</td> 
							<td><input type="text" id="firstname" name="firstname" size=25 /></td>
						</tr>
						<tr>
							<td>Last Name:*</td> 	
							<td><input type="text" id="lastname"name="lastname" size=25 /></td></tr>
						<tr>
							<td>E-mail:* </td>	
							<td><input type="text" id="email"name="email" size=25 /> </td></tr>
						<tr>
							<td>Location:</td> 	
							<td><input type="text" id="location"name="location" size=25 /> </td>
						</tr>
						<tr>		
							<td>Date of birth:</td>
							<td><select id="daydropdown"> </select> 
								<select id="monthdropdown"> </select> 
								<select id="yeardropdown"></select>
							</td>
						</tr>
						<tr>
							<td>Skills: </td>	 
							<td><select name="skill_id" onchange="showSkills(Prof)"> 
									<option id="">Select skill:</option>
									<option id ="1"> Beginner</option>
									<option id ="2"> Intermediate</option>
									<option id ="3"> Professional</option>
							 	</select>
							 </td>
						</tr>	
					</table>
							<p><button type="submit" value = "Submit" action="a.jsp">Submit</button> </p>
					</form>
			
					<script type="text/javascript">
					
						window.onload=function(){
							populatedropdown("daydropdown", "monthdropdown", "yeardropdown");
						};
					</script>
					
					<%@ page import="java.sql.*" import="javax.naming.*" import="javax.sql.DataSource"%>
					<%
					
				
				    try {
				    	/*
				    	Class.forName("org.gjt.mm.mysql.Driver");
				        conn =
				           DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=root&" +
				                                       "user=root&password=pothead");
				       */
				       
					   	Connection conn = null;
					   	PreparedStatement pstmt = null;
				        
					   	Context context = new InitialContext();      
				        DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Surf-San-DiegoDBPool");
				        conn=ds.getConnection();
				        
					 	int updateQuery = 0;
				        
				        pstmt = conn.prepareStatement("INSERT INTO user_info (firstname, lastname,email,location date_of_birth,skills) VALUES (?, ?, ?,?,?)");
				        pstmt.setString(1, request.getParameter("firstname"));
				        pstmt.setString(2, request.getParameter("lastname")); 
				        pstmt.setString(3, request.getParameter("email"));
				        pstmt.setString(3, request.getParameter("location"));
				        pstmt.setString(3, request.getParameter("date_of_birth"));
				        pstmt.setString(3, request.getParameter("skills"));
				        updateQuery += pstmt.executeUpdate();
				
				   		conn.commit();
				        
				        if (updateQuery != 0) 
				         	out.println("Success");
				        else
				         	out.println("Not success");
				
				        pstmt.close();
				        conn.close();
				        
				 
					}	
					catch (Exception e){
				    	e.printStackTrace();
				    }
				      %>
				      
			 <%@ page import="java.sql.*" import="javax.naming.*" import="javax.sql.DataSource"%>
	<%

    try {
    	/*
    	Class.forName("org.gjt.mm.mysql.Driver");
        conn =
           DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=root&" +
                                       "user=root&password=pothead");
       */
       
	   	Connection conn = null;
	   	PreparedStatement pstmt = null;
        
	   	Context context = new InitialContext();      
        DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Surf-San-DiegoDBPool");
        conn=ds.getConnection();
        
        ResultSet updateQuery = null;
        pstmt = conn.prepareStatement("SELECT * FROM user_info");      
        updateQuery = pstmt.executeQuery();
       
        while( updateQuery.next()){
        	      
        	out.println(updateQuery.getString(2));
        	out.println(updateQuery.getString(3));
        	out.println(updateQuery.getString(4));
        	out.println(updateQuery.getString(5));
        	out.println(updateQuery.getString(6));
        	out.println(updateQuery.getString(7));
        //	News news = new News(updateQuery.getString(1), updateQuery.getString(2));
        	
        	
        	
        }

        pstmt.close();
        conn.close();
        //rset = close();
        
    }catch (Exception e){
    	e.printStackTrace();
    }  
      %>
					
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

<%
// if(skills == "102") {
	//	out.println("Hello world");
	//}	
%>
</body>
</html>
