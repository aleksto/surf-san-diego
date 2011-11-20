<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add news</title>
</head>
<body>

<form name="frm" method="post" action="home.jsp" onSubmit="return validateForm()">
	
			<table>
				<tr>			
					<td>Headline:</td> 
					<td><input type="text" id="headline" name="headline" size=40 /></td>
				</tr>
				<tr>
					<td>Text:</td> 	
					<td> <textarea id="text" name="text" rows=20" cols="100"> </textarea></td>
				</tr>
			</table>
	</form>
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
        
        pstmt = conn.prepareStatement("INSERT INTO news (headline,text,timestamp) VALUES (?, ?, ?)");
        pstmt.setString(1, request.getParameter("headline"));
        pstmt.setString(2, request.getParameter("text")); 
        pstmt.setString(2, request.getParameter("newsDate"));
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
      
      	<form name="frm" method="post" action="home.jsp" >
			 	<p><button type="submit" value = "Submit">Post news</button> </p>
		</form>

	
		
</body>
</html>