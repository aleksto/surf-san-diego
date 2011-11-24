<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
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
        String id = request.getParameter("id");
		session.setAttribute("id", id); 
		out.println(session.getAttribute("id").toString() + "<br>");
		
		Connection conn = null;
	   	Context context = new InitialContext();      
        DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Surf-San-DiegoDBPool");
        conn=ds.getConnection();
        
        PreparedStatement pstmt = null;
        int updateQuery = 0;

        ResultSet resultSet = null; 
		pstmt = conn.prepareStatement(" SELECT id FROM city");
		resultSet = pstmt.executeQuery();
		
        pstmt.close();

		pstmt = conn.prepareStatement("INSERT INTO news (headline, text, city_id) VALUES (?, ?, ?)");
        pstmt.setString(1, request.getParameter("headline"));
        pstmt.setString(2, request.getParameter("text"));
        pstmt.setInt(3, Integer.valueOf(session.getAttribute("id").toString()));
        updateQuery += pstmt.executeUpdate();
        out.println(updateQuery);
        if (updateQuery != 0) 
         	out.println("Success");
        else
         	out.println("Not success");
        pstmt.close();
        
        conn.commit();
        conn.close();
        
	}catch (Exception e){
    	e.printStackTrace();
    }  
        
		 String redirectURL = "../poster/home.jsp";
		   response.sendRedirect(redirectURL);
    
	%>	
		

</body>
</html>