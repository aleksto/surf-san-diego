<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
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
       String city_id = request.getParameter("city_id");
	   session.setAttribute("city_id", city_id); 
       
	
       out.println(session.getAttribute("city_id").toString() + "<br>");
       
          
	   	Connection conn = null;
	   	Context context = new InitialContext();      
        DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Surf-San-DiegoDBPool");
        conn=ds.getConnection();
        
        PreparedStatement pstmt = null;
        int updateQuery = 0;
       

        ResultSet resultSet = null;
        pstmt = conn.prepareStatement("SELECT id FROM user_info WHERE id=(SELECT max(id) FROM user_info)");      
        resultSet = pstmt.executeQuery();
        int index = 0;
        while(resultSet.next()){
        	index = resultSet.getInt(1);
        }
        out.println("Index: "+ index);
        pstmt.close();
       
        
        ResultSet resultSet2 = null;
        pstmt = conn.prepareStatement("SELECT id FROM user_account WHERE id=(SELECT max(id) FROM user_account)");      
        resultSet = pstmt.executeQuery();
        int index2 = 0;
        while(resultSet.next()){
        	index2 = resultSet.getInt(1);
        }
        out.println("Index2: "+ index);
        pstmt.close();
        
        pstmt = conn.prepareStatement("INSERT INTO user_role (user_account_id, role, username) VALUES (?, ?, ?)");
        pstmt.setInt(1, index2);
        pstmt.setString(2, "user");
        pstmt.setString(3, request.getParameter("username"));
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
     


    String redirectURL = "../sites/home/user/showNews.do";
    response.sendRedirect(redirectURL);
    
    %>

    </body>
</html>
    