<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>The surfer</title>
</head>
<body>
		
		
		 
		<%@ page import="java.sql.*" import="javax.naming.*" import="javax.sql.DataSource" import = "java.util.GregorianCalendar" %>

	<% 
	
    try {
    	/*
    	Class.forName("org.gjt.mm.mysql.Driver");
        conn =
           DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=root&" +
                                       "user=root&password=pothead");
       */
       
      
       out.println(request.getParameter("headline") + "<br>");
       out.println(request.getParameter("text") + "<br>");
       
       Connection conn = null;
	   	Context context = new InitialContext();      
	    DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Surf-San-DiegoDBPool");
	    conn=ds.getConnection();
	    
	    PreparedStatement pstmt = null;
        int updateQuery = 0;
      
        pstmt = conn.prepareStatement("INSERT INTO news (headline, text) VALUES (?, ?)");
        pstmt.setString(1, request.getParameter("headline"));
        pstmt.setString(2, request.getParameter("text"));
        
        updateQuery += pstmt.executeUpdate();
        out.println(updateQuery);
        conn.commit();
        
        if (updateQuery != 0) 
         	out.println("Success");
        else
         	out.println("Not success");
        pstmt.close();
        conn.close();
        
 
	}catch (Exception e){
    	e.printStackTrace();
    }  
        
		
		 String redirectURL = "../poster/home.jsp";
		   response.sendRedirect(redirectURL);
		    
	%>	
		

</body>
</html>