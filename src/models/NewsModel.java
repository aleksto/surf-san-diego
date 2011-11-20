package models;

import java.sql.Timestamp;

public class NewsModel {
	
	private String title;
	private String text;
	private Timestamp timestamp;
	
	public NewsModel(String title, String text, Timestamp timestamp){
		this.setTitle(title);
		this.text = text;
		this.setTimestamp(timestamp);
		
	}
	
	public String getDate(){
		int year = timestamp.getYear()+1900;
		return year + "-" + timestamp.getMonth() + "-" + timestamp.getDate();
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
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
}
