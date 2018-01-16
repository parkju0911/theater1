package com.theater.review;

import java.sql.Date;

import com.theater.member.MemberDTO;

public class ReviewDTO extends MemberDTO{
	
	private int review_num;
    private String title;
    private String contents;
    private String id;
    private int star;
    private Date review_date;
    private int file_num;
    private int drama_num;

    

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
}
