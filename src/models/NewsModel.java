package models;

public class NewsModel {
	
	private String title;
	private String text;
	
	public NewsModel(String title, String text){
		this.setTitle(title);
		this.text = text;
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
}
