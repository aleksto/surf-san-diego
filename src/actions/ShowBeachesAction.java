package actions;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.BeachModel;
import models.DBModel;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ShowBeachesAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)  {
		DBModel dbModel = null;
		ArrayList<BeachModel> beachModels = null;
		try {
			dbModel = new DBModel();
			beachModels = dbModel.getBeaches();
			dbModel.closeDB();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// Store the RowSet in the request scope
		request.setAttribute("beaches", beachModels);
		
		return mapping.findForward("success");
	}
}