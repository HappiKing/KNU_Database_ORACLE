package sco;

import java.util.Date;

public class Schedule {
	private String Schedule_id;
    private Date Schedule_date;
    private String Stadium_name;
    
	public String getSchedule_id() {
		return Schedule_id;
	}
	public void setSchedule_id(String schedule_id) {
		Schedule_id = schedule_id;
	}
	public Date getSchedule_date() {
		return Schedule_date;
	}
	public void setSchedule_date(Date schedule_date) {
		Schedule_date = schedule_date;
	}
	public String getStadium_name() {
		return Stadium_name;
	}
	public void setStadium_name(String stadium_name) {
		Stadium_name = stadium_name;
	}    
}
