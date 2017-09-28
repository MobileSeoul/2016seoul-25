package com.food.domain;

import org.springframework.web.multipart.MultipartFile;

public class MenuVO {
	private Integer mno;
	private String m_name;
	private Integer m_price;
	private String m_info;
	private Integer m_state;
	private String m_img;
	private String u_id;
	
	private MultipartFile file;	

	public Integer getMno() {
		return mno;
	}
	public void setMno(Integer mno) {
		this.mno = mno;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public Integer getM_price() {
		return m_price;
	}
	public void setM_price(Integer m_price) {
		this.m_price = m_price;
	}
	public String getM_info() {
		return m_info;
	}
	public void setM_info(String m_info) {
		this.m_info = m_info;
	}
	public Integer getM_state() {
		return m_state;
	}
	public void setM_state(Integer m_state) {
		this.m_state = m_state;
	}
	public String getM_img() {
		return m_img;
	}
	public void setM_img(String m_img) {
		this.m_img = m_img;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "MenuVO [mno=" + mno + ", m_name=" + m_name + ", m_price=" + m_price + ", m_info=" + m_info
				+ ", m_state=" + m_state + ", m_img=" + m_img + ", u_id=" + u_id + ", file=" + file +  "]";
	}
	
	
	
}
