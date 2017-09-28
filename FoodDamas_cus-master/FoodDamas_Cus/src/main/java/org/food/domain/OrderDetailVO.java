package org.food.domain;

public class OrderDetailVO {
	private Integer odno;
	private Integer quantity;
	private Integer mno;
	private Integer ono;
	private String m_name;
	private Integer m_price;
	
	public Integer getOdno() {
		return odno;
	}
	public void setOdno(Integer odno) {
		this.odno = odno;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getMno() {
		return mno;
	}
	public void setMno(Integer mno) {
		this.mno = mno;
	}
	public Integer getOno() {
		return ono;
	}
	public void setOno(Integer ono) {
		this.ono = ono;
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
	@Override
	public String toString() {
		return "OrderDetailVO [odno=" + odno + ", quantity=" + quantity + ", mno=" + mno + ", ono=" + ono + ", m_name="
				+ m_name + ", m_price=" + m_price + "]";
	}
 
	

}
