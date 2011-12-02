package actions;

import java.sql.SQLException;

import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.DBModel;
import models.CityModel;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ShowCityAction extends Action {
	
	
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)  {		
		String username = request.getParameter("username");

		DBModel dbModel = null;
		ArrayList<CityModel> cityModels = new ArrayList<CityModel>();
		ArrayList<CityModel> dbCityModels = null;
		
		try {
			System.out.println("Username=" + username);
			dbModel = new DBModel();
			dbCityModels = dbModel.getCity();
			if(username!=null){
				for (CityModel cityModel : dbCityModels) {
					for (String dbUsername : cityModel.getUsernames()) {
						if(dbUsername.equalsIgnoreCase(username)){
							cityModels.add(cityModel);
						}
					}
				}
			}
			else{
				for (CityModel cityModel : dbCityModels) {
					cityModels.add(cityModel);
				}
			}
			dbModel.closeDB();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// Store the RowSet in the request scope
		request.setAttribute("cities", dbCityModels);
		request.setAttribute("city", cityModels);
		
		return mapping.findForward("success");
	}
}