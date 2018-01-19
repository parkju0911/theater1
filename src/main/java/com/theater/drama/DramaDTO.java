package com.theater.drama;

public class DramaDTO extends DramaFileDTO{
	
	private int drama_num;
	private int company_num;
	private String title;
    private String contents;
    private String place;
    private int price;
    private int buy_hit;
    private int file_num;
    private String simple;
    private String address;
    
    
    public String getSimple() {
		return simple;
	}
	public void setSimple(String simple) {
		this.simple = simple;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getCompany_num() {
		return company_num;
	}
	public void setCompany_num(int company_num) {
		this.company_num = company_num;
	}
	public int getFile_num() {
		return file_num;
	}
	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}
	public int getDrama_num() {
		return drama_num;
	}
	public void setDrama_num(int drama_num) {
		this.drama_num = drama_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getBuy_hit() {
		return buy_hit;
	}
	public void setBuy_hit(int buy_hit) {
		this.buy_hit = buy_hit;
	}
}
