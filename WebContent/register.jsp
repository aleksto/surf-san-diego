<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body><table><tr>
<td>
	<%@ page import="java.sql.*" import="javax.naming.*" import="javax.sql.DataSource"%>
	<%
	Connection conn = null;
    try {
    	/*
    	Class.forName("org.gjt.mm.mysql.Driver");
        conn =
           DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=root&" +
                                       "user=root&password=pothead");
       */
        
        Context context = new InitialContext();
        DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Surf-San-DiegoDBPool");
        conn=ds.getConnection();
    
        
     // Query the student PIDs
        Statement stmt = conn.createStatement();
        ResultSet rset = stmt.executeQuery("SELECT pid FROM students");
        // Print out the PID (1st attribute)
       
        while (rset.next())
        	out.println(rset.getInt(1));

      //close the result set, statement, and connection
        rset.close();
        stmt.close();
        conn.close();
 	
    /*    
        // Do something with the Connection
    } catch (SQLException ex) {
        // handle any errors
        System.out.println("SQLException: " + ex.getMessage());
        System.out.println("SQLState: " + ex.getSQLState());
        System.out.println("VendorError: " + ex.getErrorCode());
    } 
    */
    }catch (Exception e){
    	e.printStackTrace();
    }
    
    
     %>

</td>
</tr></table></body>
</html>