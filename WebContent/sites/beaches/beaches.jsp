<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<title>The surfer</title>
	<link href="./../../css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div id="wrapper">
	<div id="header">
		<div id= "head">
			<h1> <a href ="home.jsp" style ="text-decoration:none"> The surfer</a>
			</h1>
		</div>
			
		<div id="user">
			<a href="user/home.jsp" style ="text-decoration:none">Login</a>
			<a href="../../register/registerUserInformation.jsp" style ="text-decoration:none">Register new user</a>
			
		</div>
		<div id="pages">
			<ul>
				<li><a href="../../index.jsp">Home</a></li>
				<li><a href="../../beaches/beaches.jsp">Beaches</a></li>
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
			<div id="top-photo">
				<div id="photo-caption">
				<p>&raquo; Lets go surfing now...
				</p></div>
			</div>
			<h2>Beaches</h2>
			
			<a href='showBeach.do'>Link</a>
			<c:forEach var="beach" items="${ beach }">
    
            <ul>
                <li>
                    <p>${beach.getName()}</p>
                </li>
                <li>
                    <p>${beach.getDescription()}</p>
                </li>
            </ul>
           
        </c:forEach>
        
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
        pstmt = conn.prepareStatement("SELECT * FROM beach");      
        updateQuery = pstmt.executeQuery();
        while( updateQuery.next()){
        	out.println(updateQuery.getString(2));
        	out.println();
        	out.println(updateQuery.getString(3));
        //	Beaches beach = new News(updateQuery.getString(1), updateQuery.getString(2), updateQuery.getString(3));
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
</body>
</html>