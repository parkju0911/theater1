package com.theater.drama;

public class RecentDramaDTO {
	
	private int recent_num;
    private int drama_num;
    private String id;
    
	public int getRecent_num() {
		return recent_num;
	}
	public void setRecent_num(int recent_num) {
		this.recent_num = recent_num;
	}
	public int getDrama_num() {
		return drama_num;
	}
	public void setDrama_num(int drama_num) {
		this.drama_num = drama_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
