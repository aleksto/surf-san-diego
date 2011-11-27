package forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class SurfConditionForm extends ActionForm {
	
	private static final long serialVersionUID = 1L;
	private String beach_id = null;
	
	public String getBeach_id() {
		return beach_id;
	}
	
	public void setBeach_id(String beach_id) {
		this.beach_id = beach_id;
	}
	
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		if ((beach_id == null) || (beach_id.length() < 1)){
			errors.add("idMsgTag1", new ActionMessage("errors.required", "ID "));
		}
		return errors;
	}

}
