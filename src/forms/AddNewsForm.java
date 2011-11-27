package forms;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class AddNewsForm extends ActionForm{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//private String id = null;
	private String headline = null;
	private String text = null;
	private String city_id = null;
	

	/*public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}*/
	public String getHeadline() {
		return headline;
	}
	public void setHeadline(String headline) {
		this.headline = headline;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	/*public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
			ActionErrors errors = new ActionErrors();
			if ((id == null) || (id.length() < 1)){
				errors.add("idMsgTag1", new ActionMessage("errors.required", "ID"));
			}
			return errors;
	}
	*/
	
	public void setCity_id(String city_id) {
		this.city_id = city_id;
	}
	public String getCity_id() {
		return city_id;
	}
}