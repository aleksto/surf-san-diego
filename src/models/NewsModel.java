package models;

import java.sql.Timestamp;

public class NewsModel {
	
	private String headline;
	private String text;
	private Timestamp timestamp;
	private int city_id;

	public NewsModel(String headline, String text, Timestamp timestamp, int city_id){
		this.setTitle(headline);
		this.text = text;
		this.setTimestamp(timestamp);
		this.city_id = city_id;
	}
	
	public String getDate(){
		int year = timestamp.getYear()+1900;
		return year + "-" + timestamp.getMonth() + "-" + timestamp.getDate();
	}

	public void setTitle(String title) {
		this.headline = headline;
	}

	public String getTitle() {
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
}
