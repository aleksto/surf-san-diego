package actions;

import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.DBModel;
import models.UserInfoModel;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ShowUserDetailsAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response)  {		
		int userId = 1;
		DBModel dbModel = null;
		UserInfoModel userInfoModel = null;
		try {
			dbModel = new DBModel();
			userInfoModel = dbModel.getUserInfo(dbModel.getMostRecentId());
			System.out.println("UserInfoModel.getId = " + userInfoModel.getId());
			dbModel.closeDB();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// Store the RowSet in the request scope
		request.setAttribute("userInfo", userInfoModel);

		return mapping.findForward("success");
	}
}