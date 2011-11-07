<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
        
        pstmt = conn.prepareStatement("INSERT INTO users (username, password) VALUES (?, ?)");
        pstmt.setString(1, request.getParameter("username"));
        pstmt.setString(2, request.getParameter("password"));       
        updateQuery += pstmt.executeUpdate();
        
        pstmt = conn.prepareStatement("INSERT INTO user_roles (username, role) VALUES (?, ?)");
        pstmt.setString(1, request.getParameter("username"));
        pstmt.setString(2, "Member");
        updateQuery += pstmt.executeUpdate();
        
        pstmt = conn.prepareStatement("INSERT INTO user_info (username, first_name, last_name) VALUES (?, ?, ?)");
        pstmt.setString(1, request.getParameter("username"));
        pstmt.setString(2, session.getAttribute("first_name").toString());
        pstmt.setString(3, session.getAttribute("last_name").toString());
        updateQuery += pstmt.executeUpdate();

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
    
    %>
    
    	< /br> 
    	Return: <a href="index.jsp">Home</a>
    
    </body>
</html>
    