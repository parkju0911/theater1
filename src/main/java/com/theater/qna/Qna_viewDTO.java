package com.theater.qna;

import java.sql.Date;

public class Qna_viewDTO {

	private int qna_viewnum;
    private int drama_num;
	private String id;
    private String contents;
    private Date reg_date;
    private int ref;
    private int step;
    private int depth;
	
    
    public int getQna_viewnum() {
		return qna_viewnum;
	}
	public void setQna_viewnum(int qna_viewnum) {
		this.qna_viewnum = qna_viewnum;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
  
}