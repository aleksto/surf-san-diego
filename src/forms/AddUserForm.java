package forms;

import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;

import models.DBModel;
import models.UserAccountModel;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;



public class AddUserForm extends ActionForm {
	
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {	
		ActionErrors errors = new ActionErrors();
		boolean usernameExists =false;;

		try {
			DBModel dbModel = new DBModel();
			for (UserAccountModel user : dbModel.getUserAccounts()) {
				if(username.equalsIgnoreCase(user.getUsername())){
					usernameExists=true;
				}
			}
			dbModel.closeDB();
			
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if ((firstName == null) || (firstName.length() < 1)){
			errors.add("idMsgTag1", new ActionMessage("errors.required", "First name"));
		}
		
		if(usernameExists){
			errors.add("idMsgTag2", new ActionMessage("error.db", "Username exists"));
		}
		
		
		return errors;
		
		
	}

	private String firstName;
	private String lastname;
	private String email;
	private String location;
	private String day;
	private String month;
	private String year;
	private String skill;
	private String username;
	private String password;
	private String checkPassword;

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
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

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
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

	public String getCheckPassword() {
		return checkPassword;
	}

	public void setCheckPassword(String checkPassword) {
		this.checkPassword = checkPassword;
	}

}
