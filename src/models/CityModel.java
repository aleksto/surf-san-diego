package models;

public class CityModel {
	

	private String city;
	private int id;
	
	public CityModel(int id, String city){
	
		this.id=id;
		this.city = city;
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
}