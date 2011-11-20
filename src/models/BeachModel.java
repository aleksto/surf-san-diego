package models;

public class BeachModel {
		
	private String name;
	private String description;
	
	public BeachModel(String name, String description){
		this.setName(name);
		this.description = description;
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
