package actions;

import java.sql.SQLException;


import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.DBModel;
import models.NewsModel;
import models.SurfLocationModel;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ShowNewsAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)  {		
		DBModel dbModel = null;
		
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		ArrayList<NewsModel> newsModels = null;
		ArrayList<SurfLocationModel> surfLocationModels = null;
		try {
			dbModel = new DBModel();
			for (SurfLocationModel surfLocationModel : dbModel.getSurfLocationModels()) {
				if(username.equalsIgnoreCase((surfLocationModel.getUsername()))){
					newsModels = dbModel.getNews( Integer.valueOf(surfLocationModel.getCity_id()));
				}
				else{
					newsModels = dbModel.getNews( Integer.valueOf(id));
				}
			}
			
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
