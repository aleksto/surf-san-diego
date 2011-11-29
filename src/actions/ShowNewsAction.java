package actions;

import java.sql.SQLException;


import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.DBModel;
import models.NewsModel;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ShowNewsAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)  {		
		DBModel dbModel = null;
		ArrayList<NewsModel> newsModels = null;
		try {
			dbModel = new DBModel();
			newsModels = dbModel.getNews();
			dbModel.closeDB();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// Store the RowSet in the request scope
		request.setAttribute("news", newsModels);

		return mapping.findForward("success");
	}
}
