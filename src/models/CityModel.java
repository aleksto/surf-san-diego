package models;

import java.util.ArrayList;

public class CityModel {
	

	private String city;
	private int id;
	private ArrayList <String> usernames;
	
	public CityModel(int id, String city,ArrayList<String> usernames ){
	
		this.id=id;
		this.city = city;
		this.usernames = usernames;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCity() {
		return city;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setUsernames(ArrayList<String> usernames) {
		this.usernames = usernames;
	}

	public ArrayList<String> getUsernames() {
		return usernames;
	}
}