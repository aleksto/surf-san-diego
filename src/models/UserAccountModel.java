package models;

public class UserAccountModel {
	
	private int id;
	private String username;
	private String password;
	private int userId;

	public UserAccountModel(int id, String username, String password, int userId){
		this.id = id;
		this.username = username;
		this.password = password;
		this.userId = userId;
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	
}
