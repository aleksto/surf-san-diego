package actions;

import java.sql.SQLException;

import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.SurfConModel;
import models.DBModel;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ShowSurfConAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)  {
		String id = request.getParameter("id");
		DBModel dbModel = null;
		ArrayList<SurfConModel> surfConModel = null;
		try {
			dbModel = new DBModel();
			surfConModel = dbModel.getSurfConditions(Integer.valueOf(id));
			dbModel.closeDB();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("surf_conditions", surfConModel);

		return mapping.findForward("success");
	}
}
