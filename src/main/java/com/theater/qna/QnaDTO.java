package com.theater.qna;

import java.sql.Date;

public class QnaDTO {

	private int faq_num;
    private String id;
    private String title;
    private String contents;
   
    
	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int qna_num) {
		this.faq_num = faq_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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

}
