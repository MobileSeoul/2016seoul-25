package com.food.domain;

import java.util.Date;

public class AnswerVO {
	private Integer ano;
	private String a_content;

	private Date reg_date;
	private Date modi_date;
	
	private Integer qno;
	private String writer;
	public Integer getAno() {
		return ano;
	}
	public void setAno(Integer ano) {
		this.ano = ano;
	}
	public String getA_content() {
		return a_content;
	}
	public void setA_content(String a_content) {
		this.a_content = a_content;
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
	public Integer getQno() {
		return qno;
	}
	public void setQno(Integer qno) {
		this.qno = qno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "AnswerVO [ano=" + ano + ", a_content=" + a_content + ", reg_date=" + reg_date + ", modi_date="
				+ modi_date + ", qno=" + qno + ", writer=" + writer + "]";
	}
	
	
	
}
