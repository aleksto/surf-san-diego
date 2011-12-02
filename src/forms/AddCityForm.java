package forms;

import org.apache.struts.action.ActionForm;
public class AddCityForm extends ActionForm{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username = null;
	private String city_id = null;
	

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	public void setCity_id(String city_id) {
		this.city_id = city_id;
	}
	public String getCity_id() {
		return city_id;
	}
}