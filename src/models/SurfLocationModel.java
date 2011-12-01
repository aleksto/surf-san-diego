package models;

public class SurfLocationModel {
	private String username;
	private int city_id;

	public SurfLocationModel(String username, int city_id) {
		this.username = username;
		this.city_id = city_id;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsername() {
		return username;
	}

	public void setCity_id(int city_id) {
		this.city_id = city_id;
	}

	public int getCity_id() {
		return city_id;
	}
	
	
}
