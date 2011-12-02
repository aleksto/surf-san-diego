package models;

import java.sql.Timestamp;

public class NewsModel {
	
	private int id;
	private String headline;
	private String text;
	private Timestamp timestamp;
	private int city_id;
	private String city;

	public NewsModel(int id, String headline, String text, Timestamp timestamp, int city_id, String city){
		this.id = id;
		this.setHeadline(headline);
		this.text = text;
		this.setTimestamp(timestamp);
		this.city_id = city_id;
		this.city = city;

	}
	
	public String getDate(){
		int year = timestamp.getYear()+1900;
		return year + "-" + timestamp.getMonth() + "-" + timestamp.getDate();
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}
	
	public void setHeadline(String headline) {
		this.headline = headline;
	}

	public String getHeadline() {
		return headline;
	}
	
	public void setText(String text) {
		this.text = text;
	}

	public String getText() {
		return text;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}

	public Timestamp getTimestamp() {
		return timestamp;
	}
	
	public void setCity_id(int city_id) {
		this.city_id = city_id;
	}
	
	public int getCity_id() {
		return city_id;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCity() {
		return city;
	}
}
