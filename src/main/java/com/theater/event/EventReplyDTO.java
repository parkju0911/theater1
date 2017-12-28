package com.theater.event;

import java.sql.Date;

public class EventReplyDTO {
	
	private int evnet_num;
    private int reply_num;
    private String contents;
    private String writer;
    private Date reg_date;
    
	public int getEvnet_num() {
		return evnet_num;
	}
	public void setEvnet_num(int evnet_num) {
		this.evnet_num = evnet_num;
	}
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
