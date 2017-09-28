package com.food.domain;

import java.util.ArrayList;
import java.util.List;

public class CustomerVO {
	private String c_id;
	private String c_pw;
	private String c_phone;
	private String c_address;
	private String c_mail;
	private List<QnAVO> listQna = new ArrayList<QnAVO>();
	private List<OrderVO> listOrder = new ArrayList<OrderVO>();
	
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_pw() {
		return c_pw;
	}
	public void setC_pw(String c_pw) {
		this.c_pw = c_pw;
	}
	public String getC_phone() {
		return c_phone;
	}
	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
	public String getC_address() {
		return c_address;
	}
	public void setC_address(String c_address) {
		this.c_address = c_address;
	}
	public String getC_mail() {
		return c_mail;
	}
	public void setC_mail(String c_mail) {
		this.c_mail = c_mail;
	}
	public List<QnAVO> getListQna() {
		return listQna;
	}
	public void setListQna(List<QnAVO> listQna) {
		this.listQna = listQna;
	}
	public List<OrderVO> getListOrder() {
		return listOrder;
	}
	public void setListOrder(List<OrderVO> listOrder) {
		this.listOrder = listOrder;
	}
	@Override
	public String toString() {
		return "CustomerVO [c_id=" + c_id + ", c_pw=" + c_pw + ", c_phone=" + c_phone + ", c_address=" + c_address
				+ ", c_mail=" + c_mail + ", listQna=" + listQna + ", listOrder=" + listOrder + "]";
	}
	
	
	
}
