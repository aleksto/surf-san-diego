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
		
		String cityId = request.getParameter("id");
		String username = request.getParameter("username");
		
		
		System.out.println("___ID___ = " + cityId);

		ArrayList<NewsModel> newsModels = new ArrayList<NewsModel>();
		try {
			dbModel = new DBModel();
			for (SurfLocationModel surfLocationModel : dbModel.getSurfLocationModels()) {
				System.out.println("Running through SurfLocations");
				for (NewsModel newsModel : dbModel.getNews()) {
					System.out.println("Running through Newsmodels");
					if(surfLocationModel.getUsername().equalsIgnoreCase(username) && newsModel.getCity_id()==Integer.valueOf(cityId) && Integer.valueOf(cityId)!=0){
						newsModels.add(newsModel);
					}
				}
				
			}
			
			if(newsModels.size() == 0){
				if(username==null || Integer.valueOf(cityId)==0 || cityId==null){
					for (NewsModel newsModel : dbModel.getNews()) {
						newsModels.add(newsModel);
					}
				}
				
			}
			
			dbModel.closeDB();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		for (NewsModel newsModel : newsModels) {
			System.out.println("PREPARING SHOW NEWS. TITLE: " + newsModel.getHeadline());
		}
		
		System.out.println("About to return");
		
		// Store the RowSet in the request scope
		request.setAttribute("news", newsModels);

		return mapping.findForward("success");
	}
}
