package com.food.domain;

import java.sql.Date;

public class NoticeVO {
	
	private int nno;
	private String a_id;
	private String title;
	private String content;
	private String reg_date;
	private String modi_date;
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getModi_date() {
		return modi_date;
	}
	public void setModi_date(String modi_date) {
		this.modi_date = modi_date;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [nno=" + nno + ", a_id=" + a_id + ", title=" + title + ", content=" + content + ", reg_date="
				+ reg_date + ", modi_date=" + modi_date + "]";
	}
	
	
	
	
	
}
