package forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class BeachEvaluationForm extends ActionForm{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String beachId = null;
	private String username = null;
	private String comment = null;
	private String rating = null;

	public String getBeachId() {
		return beachId;
	}
	public void setBeachId(String beachId) {
		this.beachId = beachId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsername() {
		return username;
	}

	
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
			ActionErrors errors = new ActionErrors();
			if ((beachId == null) || (beachId.length() < 1)){
				errors.add("idMsgTag1", new ActionMessage("errors.required", "ID"));
			}
			return errors;
	}
	
	

}