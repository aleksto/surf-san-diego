package actions;

import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.DBModel;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import forms.AddCityForm;

public class InsertCityAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)  {

		// Cast the form
		AddCityForm addCityForm = (AddCityForm) form;
		
		DBModel dbModel = null;
		try {
			dbModel = new DBModel();
			
			System.out.println(addCityForm.getUsername());
			dbModel.updateCity(addCityForm.getUsername(), Integer.valueOf(addCityForm.getCity_id()));
			
			//Integer.valueOf(addCityForm.getUser_id()),
			dbModel.closeDB();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return mapping.findForward("success");
	}
}