package com.theater.drama;

public class DramaListDTO {
	
	private int date_num;
	private int drama_num;
    private String drama_date;
    private String drama_time;
    
	public int getDate_num() {
		return date_num;
	}
	public void setDate_num(int date_num) {
		this.date_num = date_num;
	}
	public int getDrama_num() {
		return drama_num;
	}
	public void setDrama_num(int drama_num) {
		this.drama_num = drama_num;
	}
	public String getDrama_date() {
		return drama_date;
	}
	public void setDrama_date(String drama_date) {
		this.drama_date = drama_date;
	}
	public String getDrama_time() {
		return drama_time;
	}
	public void setDrama_time(String drama_time) {
		this.drama_time = drama_time;
	}
}
