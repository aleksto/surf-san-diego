package actions;

import java.sql.Date;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.DBModel;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import forms.AddUserForm;

public class InsertUser extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)  {

		// Cast the form
		AddUserForm addUserForm = (AddUserForm) form;
		
		DBModel dbModel = null;
		System.out.println("Adding user with following properties: " + addUserForm.getFirstName() + "|||" + addUserForm.getLastname() + "|||" + addUserForm.getLocation() + "|||" + addUserForm.getSkill() + "|||" + addUserForm.getDay() + "." + addUserForm.getMonth() + "." + addUserForm.getYear()  + "|||" +  addUserForm.getEmail()  + "|||" +  addUserForm.getUsername()  + "|||" +  addUserForm.getPassword()  + "|||" + addUserForm.getCheckPassword());
		Date date = new Date(Integer.valueOf(addUserForm.getYear())-1900, Integer.valueOf(addUserForm.getMonth()), Integer.valueOf(addUserForm.getDay()));
		try {
			dbModel = new DBModel();
			dbModel.InsertUserInfo(addUserForm.getFirstName(), addUserForm.getLastname(), addUserForm.getEmail(), addUserForm.getLocation(), date, Integer.valueOf(addUserForm.getSkill()));
			dbModel.InsertUserAccount(addUserForm.getUsername(), addUserForm.getPassword());
			dbModel.InsertUserRole("user", addUserForm.getUsername());
			dbModel.closeDB();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	
		return mapping.findForward("success");
	}
}