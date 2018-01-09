package com.theater.review;

import java.sql.Date;

import com.theater.member.MemberDTO;

public class ReviewDTO extends MemberDTO{
	
	private int review_num;
    private String title;
    private String contents;
    private String writer;
    private int star;
    private Date review_date;
    private int fileNum;
    private int drama_num;

    
	
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public int getDrama_num() {
		return drama_num;
	}
	public void setDrama_num(int drama_num) {
		this.drama_num = drama_num;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
}
