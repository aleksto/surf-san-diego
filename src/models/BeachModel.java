package models;

public class BeachModel {
		
	private String name;
	private String description;
	private int id;
	
	public BeachModel(int id, String name, String description){
		this.id = id;
		this.setName(name);
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
}
