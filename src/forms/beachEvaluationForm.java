package forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class beachEvaluationForm extends ActionForm{

	private String id = null;
	private String comment = null;
	private String rating = null;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
			ActionErrors errors = new ActionErrors();
			if ((id == null) || (id.length() < 1)){
				errors.add("idMsgTag1", new ActionMessage("errors.required", "ID"));
			}
			return errors;
	}
}
