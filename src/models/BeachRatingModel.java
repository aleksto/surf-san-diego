package models;

public class BeachRatingModel {
	
	private int beachId;
	private int userId;
	private int rating;

	public BeachRatingModel(int beachId, int userId, int rating){
		this.beachId = beachId;
		this.userId = userId;
		this.rating = rating;	
	}

	public void setBeachId(int beachId) {
		this.beachId = beachId;
	}

	public int getBeachId() {
		return beachId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return userId;
	}

	public void setComment(int rating) {
		this.rating = rating;
	}

	public int getRating() {
		return rating;
	}
}