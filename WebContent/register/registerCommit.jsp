<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
       
       out.println(session.getAttribute("firstname").toString() + "<br>");
       out.println(session.getAttribute("lastname").toString() + "<br>");
       out.println(session.getAttribute("email").toString() + "<br>");
       out.println(session.getAttribute("location").toString() + "<br>");
       out.println(session.getAttribute("day") + "<br>");
       out.println(session.getAttribute("month") + "<br>");
       out.println(session.getAttribute("year") + "<br>");
       java.util.Date today = new java.util.Date();
       java.sql.Date sqlDate = new java.sql.Date(today.getTime());
       out.println(session.getAttribute("skill").toString() + "<br>");
       out.println(request.getParameter("username") + "<br>");
       out.println(request.getParameter("password") + "<br>");
       out.println(request.getParameter("checkPassword") + "<br>");
          
	   	Connection conn = null;
	   	Context context = new InitialContext();      
        DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Surf-San-DiegoDBPool");
        conn=ds.getConnection();
        
        PreparedStatement pstmt = null;
        int updateQuery = 0;
        pstmt = conn.prepareStatement("INSERT INTO user_info (firstname, lastname, email, location, date_of_birth, skill_id) VALUES (?, ?, ?, ?, ?, ?)");
        pstmt.setString(1, session.getAttribute("firstname").toString());
        pstmt.setString(2, session.getAttribute("lastname").toString());
        pstmt.setString(3, session.getAttribute("email").toString());       
        pstmt.setString(4, session.getAttribute("location").toString());       
        //FIKS DISSE!!!
        pstmt.setDate(5, sqlDate);       
        pstmt.setInt(6, 1);             
        updateQuery += pstmt.executeUpdate();
        out.println(updateQuery);
        if (updateQuery != 0) 
         	out.println("Success");
        else
         	out.println("Not success");
        pstmt.close();

        ResultSet resultSet = null;
        pstmt = conn.prepareStatement("SELECT id FROM user_info WHERE id=(SELECT max(id) FROM user_info)");      
        resultSet = pstmt.executeQuery();
        int index = 0;
        while(resultSet.next()){
        	index = resultSet.getInt(1);
        }
        out.println("Index: "+ index);
        pstmt.close();
        
        pstmt = conn.prepareStatement("INSERT INTO user_account (username, password, user_id) VALUES (?, ?, ?)");
        pstmt.setString(1, request.getParameter("username"));
        pstmt.setString(2, request.getParameter("password"));
        pstmt.setInt(3, index);
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
     
        /*
     // Query the student PIDs
        Statement stmt = conn.createStatement();
        ResultSet rset = stmt.executeQuery();
     
        // Print out the PID (1st attribute)
        while (rset.next())
        	out.println(rset.getInt(1));

      //close the result set, statement, and connection
        rset.close();
        stmt.close();
        */
 	
    /*    
        // Do something with the Connection
    } catch (SQLException ex) {
        // handle any errors
        System.out.println("SQLException: " + ex.getMessage());
        System.out.println("SQLState: " + ex.getSQLState());
        System.out.println("VendorError: " + ex.getErrorCode());
    } 
    */

    String redirectURL = "sites/home/home.jsp";
    response.sendRedirect(redirectURL);
    
    %>

    </body>
</html>
    