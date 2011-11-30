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

import forms.BeachEvaluationForm;

public class InsertBeachEvaluationFormAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)  {

		// Cast the form
		BeachEvaluationForm beachEvaluationForm = (BeachEvaluationForm) form;
		
		DBModel dbModel = null;
		try {
			dbModel = new DBModel();
			System.out.println("BEACH_ID: " + beachEvaluationForm.getBeachId() + "USERNAME" + beachEvaluationForm.getUsername() + "COMMENT" + beachEvaluationForm.getComment() + "RATING: " + beachEvaluationForm.getRating());

			dbModel.insertComment(Integer.valueOf(beachEvaluationForm.getBeachId()), beachEvaluationForm.getUsername(), beachEvaluationForm.getComment());
			dbModel.insertRating(Integer.valueOf(beachEvaluationForm.getBeachId()), beachEvaluationForm.getUsername(), Integer.valueOf(beachEvaluationForm.getRating()));
			dbModel.closeDB();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
	
		return mapping.findForward("success");
	}
}