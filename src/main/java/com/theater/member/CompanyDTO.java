package com.theater.member;

public class CompanyDTO {
	
	private String id;
    private int company_num;
    private int row;
    private int col;
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCompany_num() {
		return company_num;
	}
	public void setCompany_num(int company_num) {
		this.company_num = company_num;
	}
	public int getRow() {
		return row;
	}
	public void setRow(int row) {
		this.row = row;
	}
	public int getCol() {
		return col;
	}
	public void setCol(int col) {
		this.col = col;
	}
}
