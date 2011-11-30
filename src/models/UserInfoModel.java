package models;

import java.sql.Date;


public class UserInfoModel {
	
	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String location;
	private int skillId;
	private String skill;
	private Date date;

	public UserInfoModel(int id, String firstName, String lastName, String email, String location, Date date, int skillId){
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.location = location;
		this.date = date;
		this.skillId = skillId;
		
		if(skillId==1)
			skill="Pro";
		else if(skillId==2)
			skill="Medium";
		else if(skillId==3)
			skill="Beginner";
		else
			skill="";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getSkillId() {
		return skillId;
	}

	public void setSkillId(int skillId) {
		this.skillId = skillId;
	}
	
	public String getSkill(){
		return this.skill;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Date getDate() {
		return date;
	}
	
	
	



}
