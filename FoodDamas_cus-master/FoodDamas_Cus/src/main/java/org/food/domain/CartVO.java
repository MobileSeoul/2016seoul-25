package org.food.domain;

import java.util.Date;

public class CartVO {
	private Integer cno;
	private Integer mno;
	private Date regdate;
	private Integer quantity;
	private Integer check_out;// 장바구니에서 구매를하면 체크아웃으로 ㄱㄱ
	private String c_id;
	private String m_name;
	private Integer m_price;
	
	public Integer getM_price() {
		return m_price;
	}


	public void setM_price(Integer m_price) {
		this.m_price = m_price;
	}


	public Integer getCno() {
		return cno;
	}


	public void setCno(Integer cno) {
		this.cno = cno;
	}


	public Integer getMno() {
		return mno;
	}


	public void setMno(Integer mno) {
		this.mno = mno;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	public Integer getQuantity() {
		return quantity;
	}


	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}


	public Integer getCheck_out() {
		return check_out;
	}


	public void setCheck_out(Integer check_out) {
		this.check_out = check_out;
	}


	public String getC_id() {
		return c_id;
	}


	public void setC_id(String c_id) {
		this.c_id = c_id;
	}


	public String getM_name() {
		return m_name;
	}


	public void setM_name(String m_name) {
		this.m_name = m_name;
	}


	@Override
	public String toString() {
		return "CartVO [cno=" + cno + ", mno=" + mno + ", regdate=" + regdate + ", quantity=" + quantity
				+ ", check_out=" + check_out + ", c_id=" + c_id + ", m_name=" + m_name + ", m_price=" + m_price + "]";
	}




	
}
