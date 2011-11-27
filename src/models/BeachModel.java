package models;

import java.util.ArrayList;

public class BeachModel {
		
	private int id;
	private String name;
	private String description;
	private ArrayList<BeachCommentModel> comments;
	private ArrayList<BeachRatingModel> ratings;
	private ArrayList<SurfConModel> surfCons;
	
	public BeachModel(int id, String name, String description, ArrayList<BeachCommentModel> comments, 
			ArrayList<BeachRatingModel> ratings, ArrayList<SurfConModel> surfCons){
		this.id = id;
		this.comments = comments;
		this.ratings = ratings;
		this.surfCons = surfCons;
		this.name = name;
		this.description = description;
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
	
	public void setSurfCons(ArrayList<SurfConModel> surfCons) {
		this.surfCons = surfCons;
	}

	public ArrayList<SurfConModel> getSurfCons() {
		return surfCons;
	}
}
