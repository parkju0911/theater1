package com.theater.drama;

import java.sql.Date;

public class SeatDTO {

	private int drama_num;
    private int buy_num;
    private String select_seat;
    private String id;
    private Date drama_date;
    private String drama_time;
    private int ticket_numbers;
    private int date_num;
    
	public int getDrama_num() {
		return drama_num;
	}
	public void setDrama_num(int drama_num) {
		this.drama_num = drama_num;
	}
	public int getBuy_num() {
		return buy_num;
	}
	public void setBuy_num(int buy_num) {
		this.buy_num = buy_num;
	}
	public String getSelect_seat() {
		return select_seat;
	}
	public void setSelect_seat(String select_seat) {
		this.select_seat = select_seat;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getDrama_date() {
		return drama_date;
	}
	public void setDrama_date(Date drama_date) {
		this.drama_date = drama_date;
	}
	
	public String getDrama_time() {
		return drama_time;
	}
	public void setDrama_time(String drama_time) {
		this.drama_time = drama_time;
	}
	public int getTicket_numbers() {
		return ticket_numbers;
	}
	public void setTicket_numbers(int ticket_numbers) {
		this.ticket_numbers = ticket_numbers;
	}
	public int getDate_num() {
		return date_num;
	}
	public void setDate_num(int date_num) {
		this.date_num = date_num;
	}
	
}
