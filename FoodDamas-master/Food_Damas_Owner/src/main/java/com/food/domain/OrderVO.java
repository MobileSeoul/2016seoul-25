package com.food.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderVO {
	private Integer ono;
	private Integer total_price;
	private Date regdate;
	private Date pickup_time;
	private String c_msg;
	private String c_id;
	private OrderStateVO state;
	private List<OrderDetailVO> listOrderDetail = new ArrayList<OrderDetailVO>();
	
	
	
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public Integer getOno() {
		return ono;
	}
	public void setOno(Integer ono) {
		this.ono = ono;
	}
	public Integer getTotal_price() {
		return total_price;
	}
	public void setTotal_price(Integer total_price) {
		this.total_price = total_price;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getPickup_time() {
		return pickup_time;
	}
	public void setPickup_time(Date pickup_time) {
		this.pickup_time = pickup_time;
	}
	public String getC_msg() {
		return c_msg;
	}
	public void setC_msg(String c_msg) {
		this.c_msg = c_msg;
	}
	public OrderStateVO getState() {
		return state;
	}
	public void setState(OrderStateVO state_code) {
		this.state = state_code;
	}
	public List<OrderDetailVO> getListOrderDetail() {
		return listOrderDetail;
	}
	public void setListOrderDetail(List<OrderDetailVO> listOrderDetail) {
		this.listOrderDetail = listOrderDetail;
	}
	@Override
	public String toString() {
		return "OrderVO [ono=" + ono + ", total_price=" + total_price + ", regdate=" + regdate + ", pickup_time="
				+ pickup_time + ", c_msg=" + c_msg + ", c_id=" + c_id + ", state=" + state + ", listOrderDetail="
				+ listOrderDetail + "]";
	}
	
	
	
	
}
