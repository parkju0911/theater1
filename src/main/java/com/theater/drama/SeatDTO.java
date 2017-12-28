package com.theater.drama;

import java.sql.Date;

public class SeatDTO {

	private int drama_num;
    private int buy_num;
    private int select_seat;
    private String id;
    private Date drama_date;
    private int tickct_numbers;
    
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
	public int getSelect_seat() {
		return select_seat;
	}
	public void setSelect_seat(int select_seat) {
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
	public int getTickct_numbers() {
		return tickct_numbers;
	}
	public void setTickct_numbers(int tickct_numbers) {
		this.tickct_numbers = tickct_numbers;
	}
}
