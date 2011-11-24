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
	
	@SuppressWarnings("deprecation")
	public ArrayList<NewsModel> getNews() throws SQLException{
		ArrayList<NewsModel> newsModels = new ArrayList<NewsModel>();
		PreparedStatement pstmt = null;
		ResultSet updateQuery = null;
        pstmt = conn.prepareStatement("SELECT headline, text, newsDate FROM news");      
        updateQuery = pstmt.executeQuery();
        while(updateQuery.next()){
        	System.out.println("Adding: " + updateQuery.getString(1) + " and: " + updateQuery.getString(2) + "and: " + (updateQuery.getTimestamp(3).getYear()+1900) + " to ArrayList");
        	NewsModel newsModel = new NewsModel(updateQuery.getString(1), updateQuery.getString(2), updateQuery.getTimestamp(3));
        	newsModels.add(newsModel);
        }
	    pstmt.close();
	    return newsModels;	
	
	}  
	
	
	public ArrayList<BeachModel> getBeaches() throws SQLException{
		ArrayList<BeachModel> beachModels = new ArrayList<BeachModel>();
		PreparedStatement pstmt = null;
		ResultSet updateQuery = null;
        pstmt = conn.prepareStatement("SELECT id, name, description FROM beach"); 
        updateQuery = pstmt.executeQuery();
        while(updateQuery.next()){
            ArrayList<BeachCommentModel> comments = getComments(updateQuery.getInt(1));
            ArrayList<BeachRatingModel> ratings = getRatings(updateQuery.getInt(1));
        	System.out.println("ADDING: " + updateQuery.getInt(1) + " AND: " + updateQuery.getString(2) + " AND: " + updateQuery.getString(3) + "+++ to BeachList");
        	BeachModel beachModel = new BeachModel(updateQuery.getInt(1), updateQuery.getString(2), updateQuery.getString(3), comments, ratings);
        	beachModels.add(beachModel);
        }
	    pstmt.close();
	    return beachModels;    
	} 
	
	public ArrayList<BeachCommentModel> getComments(int beachId) throws SQLException {
		ArrayList<BeachCommentModel> beachComments = new ArrayList<BeachCommentModel>();
		PreparedStatement pstmt = null;
		ResultSet updateQuery = null;
        pstmt = conn.prepareStatement("SELECT user_id, comment FROM beach_comment WHERE beach_id=" + beachId);  
        updateQuery = pstmt.executeQuery();
        while(updateQuery.next()){
        	System.out.println("ADDING: " + updateQuery.getInt(1) + " to CommentList");
        	BeachCommentModel beachComment = new BeachCommentModel(beachId, updateQuery.getInt(1), updateQuery.getString(2));
        	beachComments.add(beachComment);
        }
        pstmt.close();
        return beachComments;
	}

	public ArrayList<BeachRatingModel> getRatings(int beachId) throws SQLException {
		ArrayList<BeachRatingModel> beachRatings = new ArrayList<BeachRatingModel>();
		PreparedStatement pstmt = null;
		ResultSet updateQuery = null;
        pstmt = conn.prepareStatement("SELECT user_id, rating FROM beach_rating WHERE beach_id=" + beachId);  
        updateQuery = pstmt.executeQuery();
        while(updateQuery.next()){
        	System.out.println("ADDING: " + updateQuery.getInt(1) + " to CommentList");
        	BeachRatingModel beachRating = new BeachRatingModel(beachId, updateQuery.getInt(1), updateQuery.getInt(2));
        	beachRatings.add(beachRating);
        }
        pstmt.close();
        return beachRatings;
	}

	public ArrayList<SurfConModel> getSurfConditions() throws SQLException{
		ArrayList<SurfConModel> surfConModels = new ArrayList<SurfConModel>();
		PreparedStatement pstmt = null;
		ResultSet updateQuery = null;
        pstmt = conn.prepareStatement("SELECT * FROM surf_conditions");      
        updateQuery = pstmt.executeQuery();
        while(updateQuery.next()){
        	System.out.println("ADDING: " + updateQuery.getInt(1) + " to ArrayList");
        	SurfConModel surfConModel = new SurfConModel(updateQuery.getInt(1), updateQuery.getDate(2), updateQuery.getTime(3), 
        			updateQuery.getString(4), updateQuery.getString(5), updateQuery.getString(6), updateQuery.getString(7), updateQuery.getInt(8));
        	surfConModels.add(surfConModel);
        }
	    pstmt.close();
	    return surfConModels;  
	} 
	
	public ArrayList<CityModel> getCity() throws SQLException{
		ArrayList<CityModel> cityModels = new ArrayList<CityModel>();
		PreparedStatement pstmt = null;
		ResultSet updateQuery = null;
		pstmt = conn.prepareStatement("SELECT id, city FROM city");     
        updateQuery = pstmt.executeQuery();
        while(updateQuery.next()){
        	System.out.println("Adding: " + updateQuery.getInt(1) + " and: " + updateQuery.getString(2) +" to ArrayList");
        	CityModel cityModel = new CityModel(updateQuery.getInt(1), updateQuery.getString(2));
        	cityModels.add(cityModel);
        }
	    pstmt.close();
	    return cityModels;	
	
	}  
	
	
	public void closeDB() throws SQLException{
	     conn.close();

	}
		
		
}
