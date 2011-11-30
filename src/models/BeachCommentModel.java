package models;

public class BeachCommentModel {
	
	private int beachId;
	private int userId;
	private String username;
	private String comment;


	public BeachCommentModel(int beachId, int userId, String username, String comment){
		this.beachId = beachId;
		this.userId = userId;
		this.username = username;
		this.comment = comment;	
	}

	public void setBeachId(int beachId) {
		this.beachId = beachId;
	}

	public int getBeachId() {
		return beachId;
	}
	

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getComment() {
		return comment;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsername() {
		return username;
	}



}

