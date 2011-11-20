package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBModel{

	private Connection conn;
	
	public DBModel() throws NamingException, SQLException {
		conn = null;
  
		Context context = new InitialContext();      
		DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Surf-San-DiegoDBPool");
		conn=ds.getConnection();  
		
	}
	
	public ArrayList<NewsModel> getNews() throws SQLException{
		ArrayList<NewsModel> newsModels = new ArrayList<NewsModel>();
		PreparedStatement pstmt = null;
		ResultSet updateQuery = null;
        pstmt = conn.prepareStatement("SELECT headline,text FROM news");      
        updateQuery = pstmt.executeQuery();
        while(updateQuery.next()){
        	System.out.println("Adding: " + updateQuery.getString(1) + " and: " + updateQuery.getString(2) + " to ArrayList");
        	NewsModel newsModel = new NewsModel(updateQuery.getString(1), updateQuery.getString(2));
        	newsModels.add(newsModel);
        }
	    pstmt.close();
	    return newsModels;
	    
	}  
	
	public ArrayList<BeachModel> getBeaches() throws SQLException{
		ArrayList<BeachModel> beachModels = new ArrayList<BeachModel>();
		PreparedStatement pstmt = null;
		ResultSet updateQuery = null;
        pstmt = conn.prepareStatement("SELECT * FROM beach");      
        updateQuery = pstmt.executeQuery();
        while(updateQuery.next()){
        	System.out.println("Adding: " + updateQuery.getString(2) + " and: " + updateQuery.getString(3) + " to ArrayList");
        	BeachModel beachModel = new BeachModel(updateQuery.getString(2), updateQuery.getString(3));
        	beachModels.add(beachModel);
        }
	    pstmt.close();
	    return beachModels;
	    
	} 
	
	public void closeDB() throws SQLException{
	     conn.close();

	}
		
		
}
