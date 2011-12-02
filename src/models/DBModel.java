package models;

import java.sql.Connection;
import java.sql.Date;
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
	
	//Vurderer Œ bytte Access Control til id-nummer istedenfor brukernavn
	public int getUserId(String username) throws SQLException{
		int userId = 0;
		PreparedStatement pstmt = null;
		ResultSet updateQuery = null;
        pstmt = conn.prepareStatement("SELECT id FROM user_account WHERE username='" + username + "'");  
        updateQuery = pstmt.executeQuery();
        while(updateQuery.next()){
        	System.out.println("getUserId getting: " + updateQuery.getInt(1));
        	userId = updateQuery.getInt(1);
        }
        pstmt.close();
        return userId;
	}
	
	
	public int getMostRecentId() throws SQLException{
		int userId = 0;
		PreparedStatement pstmt = null;
		ResultSet updateQuery = null;
        pstmt = conn.prepareStatement("SELECT id FROM user_info WHERE id=(SELECT max(id) FROM user_info)");
        updateQuery = pstmt.executeQuery();
        while(updateQuery.next()){
        	System.out.println("getMostRecentId getting: " + updateQuery.getInt(1));
        	userId = updateQuery.getInt(1);
        }
        pstmt.close();
        return userId;
	}
	
	
	public void InsertUserInfo(String firstName, String lastName, String email, String location, Date dateOfBirth, int skill_id) throws SQLException{
		PreparedStatement pstmt = null;
        int updateQuery = 0;
        pstmt = conn.prepareStatement("INSERT INTO user_info (firstname, lastname, email, location, date_of_birth, skill_id) VALUES (?, ?, ?, ?, ?, ?)");
        pstmt.setString(1, firstName);       
        pstmt.setString(2, lastName);
        pstmt.setString(3, email);
        pstmt.setString(4, location);
        pstmt.setDate(5, dateOfBirth);
        pstmt.setInt(6, skill_id);
        updateQuery += pstmt.executeUpdate();
        if (updateQuery != 0) 
         	System.out.println("insertUserInfo: Success");
        else
         	System.out.println("insertUserInfo: Not success");
        pstmt.close();
        conn.commit();
	}
	
	public void InsertUserAccount(String username, String password) throws SQLException{
		PreparedStatement pstmt = null;
        int updateQuery = 0;
        pstmt = conn.prepareStatement("INSERT INTO user_account (username, password, user_id) VALUES (?, ?, ?)");
        pstmt.setString(1, username);       
        pstmt.setString(2, password);
        pstmt.setInt(3, getMostRecentId());
        updateQuery += pstmt.executeUpdate();
        if (updateQuery != 0) 
         	System.out.println("insertUserAccount: Success");
        else
         	System.out.println("insertUserAccount: Not success");
        pstmt.close();
        conn.commit();
	}
	
	public void InsertUserRole(String role, String username) throws SQLException{
		PreparedStatement pstmt = null;
        int updateQuery = 0;
        pstmt = conn.prepareStatement("INSERT INTO user_role (user_account_id, role, username) VALUES (?, ?, ?)");
        pstmt.setInt(1, getUserId(username));       
        pstmt.setString(2, role);       
        pstmt.setString(3, username);
        updateQuery += pstmt.executeUpdate();
        if (updateQuery != 0) 
         	System.out.println("insertUserRole: Success");
        else
         	System.out.println("insertUserRole: Not success");
        pstmt.close();
        conn.commit();
	}
	
	public void insertNews(int id, String headline, String text, int city_id) throws SQLException {
        PreparedStatement pstmt = null;
        int updateQuery = 0;
        pstmt = conn.prepareStatement("INSERT INTO news (id, headline, text, city_id) VALUES (?, ?, ?, ?)");
      
        pstmt.setInt(1, id);       
        pstmt.setInt(2, 1);
        pstmt.setString(3, headline);
        pstmt.setString(4, text);
        updateQuery += pstmt.executeUpdate();
        if (updateQuery != 0) 
         	System.out.println("insertNews: Success");
        else
         	System.out.println("insertNews: Not success");
        pstmt.close();
        conn.commit();
	}
	
	public void insertComment(int beachId, String username, String comment) throws SQLException {
        PreparedStatement pstmt = null;
        int updateQuery = 0;
        pstmt = conn.prepareStatement("INSERT INTO beach_comment (beach_id, user_id, comment) VALUES (?, ?, ?)");
        pstmt.setInt(1, beachId);       
        pstmt.setInt(2, getUserId(username));
        pstmt.setString(3, comment);
        updateQuery += pstmt.executeUpdate();
        if (updateQuery != 0) 
         	System.out.println("insertComment: Success");
        else
         	System.out.println("insertComment: Not success");
        pstmt.close();
        conn.commit();
	}
	
	public void insertRating(int beachId, String username, int rating) throws SQLException {
		PreparedStatement pstmt = null;
        int updateQuery = 0;
        pstmt = conn.prepareStatement("INSERT INTO beach_rating (beach_id, user_id, rating) VALUES (?, ?, ?)");
      
        pstmt.setInt(1, beachId);       
        pstmt.setInt(2, getUserId(username));
        pstmt.setInt(3, rating);
        updateQuery += pstmt.executeUpdate();
        if (updateQuery != 0) 
         	System.out.println("insertRating: Success");
        else
         	System.out.println("insertRating: Not success");
        pstmt.close();
        conn.commit();
	}
	
	@SuppressWarnings("deprecation")
	public UserInfoModel getUserInfo(int userId) throws SQLException{
		UserInfoModel userInfo = null;
		PreparedStatement pstmt = null;
		ResultSet updateQuery = null;
        pstmt = conn.prepareStatement("SELECT firstname, lastname, email, location, date_of_birth, skill_id  FROM user_info WHERE id=" + userId);  
        
        updateQuery = pstmt.executeQuery();
       
        while(updateQuery.next()){
            String firstName = updateQuery.getString(1);
            String lastName = updateQuery.getString(2);
            String email = updateQuery.getString(3);
            String location = updateQuery.getString(4);
            Date date = updateQuery.getDate(5);
            int skillId = updateQuery.getInt(6);
        	System.out.println("ADDING: " + firstName + "||| " + lastName  + "||| " + email + "||| " + location  + "||| " + date.getDate()  + "||| " + skillId +  "to CommentList");
        	userInfo = new UserInfoModel(userId, firstName, lastName, email, location, date, skillId);
        }
        pstmt.close();
        return userInfo;
	}
	
	public UserAccountModel getUserAccount(int userId) throws SQLException{
		UserAccountModel userAccount = null;
		PreparedStatement pstmt = null;
		ResultSet updateQuery = null;
        pstmt = conn.prepareStatement("SELECT * FROM user_account WHERE user_id=" + userId);  
        updateQuery = pstmt.executeQuery();
        
        while(updateQuery.next()){
        	userAccount = new UserAccountModel(updateQuery.getInt(1), updateQuery.getString(2), updateQuery.getString(3), userId);
        	if(userAccount!=null){
        		return userAccount;
        	}
        }
        pstmt.close();
        return userAccount;
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
            ArrayList<SurfConModel> surfCons = getSurfConditions(updateQuery.getInt(1));
        	System.out.println("ADDING: " + updateQuery.getInt(1) + " AND: " + updateQuery.getString(2) + " AND: " + updateQuery.getString(3) + "+++ to BeachList");
        	BeachModel beachModel = new BeachModel(updateQuery.getInt(1), updateQuery.getString(2), updateQuery.getString(3), comments, ratings, surfCons);
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
        	System.out.println("NULL: " + getUserAccount(updateQuery.getInt(1)).getUsername());
        	BeachCommentModel beachComment = new BeachCommentModel(beachId, updateQuery.getInt(1), getUserAccount(updateQuery.getInt(1)).getUsername(), updateQuery.getString(2));
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
        	System.out.println("ADDING: " + updateQuery.getInt(1) + " to RatingList");
        	BeachRatingModel beachRating = new BeachRatingModel(beachId, updateQuery.getInt(1), updateQuery.getInt(2));
        	beachRatings.add(beachRating);
        }
        pstmt.close();
        return beachRatings;
	}


	public ArrayList<SurfConModel> getSurfConditions(int beach_id) throws SQLException{
		ArrayList<SurfConModel> surfConModels = new ArrayList<SurfConModel>();
		PreparedStatement pstmt = null;
		ResultSet updateQuery = null;
        pstmt = conn.prepareStatement("SELECT * FROM surf_conditions WHERE beach_id=" + beach_id);      
        updateQuery = pstmt.executeQuery();
        while(updateQuery.next()){
        	System.out.println("ADDING: " + updateQuery.getInt(1) + " to SurfConList");
        	SurfConModel surfConModel = new SurfConModel(updateQuery.getInt(1), updateQuery.getDate(2), updateQuery.getTime(3), 
        			updateQuery.getString(4), updateQuery.getString(5), updateQuery.getString(6), updateQuery.getString(7), updateQuery.getInt(8));
        	surfConModels.add(surfConModel);
        }
	    pstmt.close();
	    return surfConModels;  
	} 
	@SuppressWarnings("deprecation")
	public ArrayList<NewsModel> getNews() throws SQLException{
			ArrayList<NewsModel> newsModels = new ArrayList<NewsModel>();
			PreparedStatement pstmt = null;
			ResultSet updateQuery = null;
	        pstmt = conn.prepareStatement("SELECT * FROM news");     
	        updateQuery = pstmt.executeQuery();
	        while(updateQuery.next()){
	        	System.out.println("Adding: " + updateQuery.getInt(1)+ updateQuery.getString(2) + " and: " + updateQuery.getString(3) + "and: " + (updateQuery.getTimestamp(4).getYear()+1900) + "and: " + updateQuery.getInt(5) + "to ArrayList");
	        	NewsModel newsModel = new NewsModel(updateQuery.getInt(1), updateQuery.getString(2), updateQuery.getString(3), updateQuery.getTimestamp(4), updateQuery.getInt(5));
	        	newsModels.add(newsModel);
	        }
		    pstmt.close();
		    return newsModels;	
		}  


	public ArrayList<SurfLocationModel> getSurfLocationModels() throws SQLException{
		ArrayList<SurfLocationModel> surfLocationModels = new ArrayList<SurfLocationModel>();
		PreparedStatement pstmt = null;
		ResultSet updateQuery = null;
		pstmt = conn.prepareStatement("SELECT username, city_id FROM surf_location");     
        updateQuery = pstmt.executeQuery();
       
        while(updateQuery.next()){
        	System.out.println("Adding: " + updateQuery.getString(1) + " and: " + updateQuery.getInt(2) +" to ArrayList");
        	SurfLocationModel surfLocationModel = new SurfLocationModel(updateQuery.getString(1), updateQuery.getInt(2));
        	surfLocationModels.add(surfLocationModel);
        }
	    pstmt.close();
	    return surfLocationModels;
	}
	

	
	public ArrayList<CityModel> getCity() throws SQLException{
		ArrayList<CityModel> cityModels = new ArrayList<CityModel>();
		PreparedStatement pstmt = null;
		ResultSet updateQuery = null;
		pstmt = conn.prepareStatement("SELECT id, city FROM city");     
        updateQuery = pstmt.executeQuery();
 
        while(updateQuery.next()){
        	ArrayList<String> usernames = new ArrayList<String>();
            for (SurfLocationModel surfLocationModel : getSurfLocationModels()) {
    			if(updateQuery.getInt(1) == surfLocationModel.getCity_id())
    				usernames.add(surfLocationModel.getUsername());
    		}
        	
        	System.out.println("Adding: " + updateQuery.getInt(1) + " and: " + updateQuery.getString(2) + "and" + "to ArrayList");
        	CityModel cityModel = new CityModel(updateQuery.getInt(1), updateQuery.getString(2), usernames);
        	cityModels.add(cityModel);
        }
	    pstmt.close();
	    return cityModels;
	}

	public void insertNews(String headline, String text, int city_id) throws SQLException {
        
		PreparedStatement pstmt = null;
        int updateQuery = 0;
        pstmt = conn.prepareStatement("INSERT INTO news (headline, text, city_id ) VALUES (?, ?, ?)"); 
        pstmt.setString(1, headline);
        pstmt.setString(2, text);
        pstmt.setInt(3,city_id);
        updateQuery += pstmt.executeUpdate();
        if (updateQuery != 0) 
         	System.out.println("insertNews: Success");
        else
         	System.out.println("insertNews: Not success");
        pstmt.close();
        conn.commit();
	}
	 


	public void insertCity(String username, int city_id) throws SQLException{
		PreparedStatement pstmt = null;
        int updateQuery = 0;
        pstmt = conn.prepareStatement("UPDATE surf_location SET city_id=? WHERE username = ?"); 
        pstmt.setInt(1, city_id);
        pstmt.setString(2, username);
        
        updateQuery += pstmt.executeUpdate();
        if (updateQuery != 0) 
         	System.out.println("insertCity: Success");
        else
         	System.out.println("insertCity: Not success");
        pstmt.close();
        conn.commit();
	}


	public void closeDB() throws SQLException{
	     conn.close();

	}

	
	
		
}