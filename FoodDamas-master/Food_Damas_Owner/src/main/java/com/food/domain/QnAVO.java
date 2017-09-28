package com.food.domain;

import java.util.Date;


public class QnAVO {
	private Integer qno;
	private String q_title;
	private String q_content;
	private Date reg_date;
	private Date modi_date;
	private String c_id;
	private String u_id;
	private Integer anscnt;
	private Integer pagecnt;
	
	public Integer getPagecnt() {
		return pagecnt;
	}
	public void setPagecnt(Integer pagecnt) {
		this.pagecnt = pagecnt;
	}
	public Integer getAnscnt() {
		return anscnt;
	}
	public void setAnscnt(Integer anscnt) {
		this.anscnt = anscnt;
	}
	public Integer getQno() {
		return qno;
	}
	public void setQno(Integer qno) {
		this.qno = qno;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getModi_date() {
		return modi_date;
	}
	public void setModi_date(Date modi_date) {
		this.modi_date = modi_date;
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
	@Override
	public String toString() {
		return "QnaVO [qno=" + qno + ", q_title=" + q_title + ", q_content=" + q_content + ", reg_date=" + reg_date
				+ ", modi_date=" + modi_date + ", c_id=" + c_id + ", u_id=" + u_id + ", anscnt=" + anscnt + "]";
	}

	
	
}
