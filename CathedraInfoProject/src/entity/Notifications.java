package entity;

import java.sql.Date;
import java.sql.Timestamp;


public class Notifications {

	private String url;
	private String title;
	private String college;
	private String speaker;
	private String venue;//地点
	private Timestamp time;//举行时间，具体到时分秒
	private Date notify_time;//发布时间，只有日期
	
	public Notifications(){
		
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCollege() {
		return college;
	}
	public void setCollege(String college) {
		this.college = college;
	}
	public String getSpeaker() {
		return speaker;
	}
	public void setSpeaker(String speaker) {
		this.speaker = speaker;
	}
	public String getVenue() {
		return venue;
	}
	public void setVenue(String venue) {
		this.venue = venue;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public Date getNotify_time() {
		return notify_time;
	}
	public void setNotify_time(Date notify_time) {
		this.notify_time = notify_time;
	}
	
}
