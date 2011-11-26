package forms;

import java.sql.Date;
import java.sql.Time;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class SurfConditionForm extends ActionForm {
	
	private int id;
	private Date date_;
	private Time time_;
	private String wave_size;
	private String wave_dir;
	private String wind_speed;
	private String wind_dir;
	private int beach_id;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date_;
	}

	public void setDate(Date date) {
		this.date_ = date;
	}

	public Time getTime() {
		return time_;
	}

	public void setTime(Time time) {
		this.time_ = time;
	}

	public String getWave_size() {
		return wave_size;
	}

	public void setWave_size(String wave_size) {
		this.wave_size = wave_size;
	}

	public String getWave_dir() {
		return wave_dir;
	}

	public void setWave_dir(String wave_dir) {
		this.wave_dir = wave_dir;
	}

	public String getWind_speed() {
		return wind_speed;
	}

	public void setWind_speed(String wind_speed) {
		this.wind_speed = wind_speed;
	}

	public String getWind_dir() {
		return wind_dir;
	}

	public void setWind_dir(String wind_dir) {
		this.wind_dir = wind_dir;
	}

	public int getBeach_id() {
		return beach_id;
	}

	public void setBeach_id(int beach_id) {
		this.beach_id = beach_id;
	}
}