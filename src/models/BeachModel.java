package models;

import java.util.ArrayList;

public class BeachModel {
		
	private int id;
	private String name;
	private String description;
	private ArrayList<BeachCommentModel> comments;
	private ArrayList<BeachRatingModel> ratings;
	
	public BeachModel(int id, String name, String description, ArrayList<BeachCommentModel> comments, ArrayList<BeachRatingModel> ratings){
		this.id = id;
		this.comments = comments;
		this.ratings = ratings;
		this.name = name;
		this.description = description;
	}
	
	public BeachModel(int id, String name){
		this.id = id;
		this.name = name;
	}
	
	public void setIndex(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public void setComments(ArrayList<BeachCommentModel> comments) {
		this.comments = comments;
	}

	public ArrayList<BeachCommentModel> getComments() {
		return comments;
	}

	public void setRatings(ArrayList<BeachRatingModel> ratings) {
		this.ratings = ratings;
	}

	public ArrayList<BeachRatingModel> getRatings() {
		return ratings;
	}
}
