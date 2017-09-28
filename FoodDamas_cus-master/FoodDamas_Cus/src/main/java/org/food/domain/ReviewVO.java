package org.food.domain;

import java.sql.Date;

public class ReviewVO {
	
	private int rno;
	private String c_id;
	private String u_id;
	private String content;
	private Integer grade;
	private Date reg_date;
	private Integer pagecnt;
	
	public Integer getPagecnt() {
		return pagecnt;
	}
	public void setPagecnt(Integer pagecnt) {
		this.pagecnt = pagecnt;
	}
	
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	
	
	@Override
	public String toString() {
		return "ReviewVO [rno=" + rno + ", c_id=" + c_id + ", u_id=" + u_id + ", content=" + content + ", grade="
				+ grade + "]";
	}
	
	
	
	
}


