package com.theater.member;

public class CompanyDTO extends MemberDTO{
	
	private String id;
    private int company_num;
    private int row_num;
    private int col_num;
    
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
	public int getRow_num() {
		return row_num;
	}
	public void setRow_num(int row_num) {
		this.row_num = row_num;
	}
	public int getCol_num() {
		return col_num;
	}
	public void setCol_num(int col_num) {
		this.col_num = col_num;
	}
	
}
