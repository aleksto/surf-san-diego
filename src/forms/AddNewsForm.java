package forms;

import org.apache.struts.action.ActionForm;

public class AddNewsForm extends ActionForm{
	/**
	 * 
	 */
	/*
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		if ((id == null) || (id.length() < 1)){
			errors.add("idMsgTag1", new ActionMessage("errors.required", "ID"));
		}
		return errors;
	}
	*/
	
	private static final long serialVersionUID = 1L;
	private String headline = null;
	private String text = null;
	private String city_id = null;
	

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
	
	public void setCity_id(String city_id) {
		this.city_id = city_id;
	}
	public String getCity_id() {
		return city_id;
	}
	

}