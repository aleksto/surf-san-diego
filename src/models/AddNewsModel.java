package models;

public class AddNewsModel {
	
	private int id;
	private int city_id;
	private String headline;
	private String text;

	public AddNewsModel(int id, int city_id, String headline, String text){
		this.id = id;
		this.city_id = city_id;
		this.headline = headline;
		this.text = text;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setCity_id(int city_id) {
		this.city_id = city_id;
	}

	public int getCity_id() {
		return city_id;
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
}
