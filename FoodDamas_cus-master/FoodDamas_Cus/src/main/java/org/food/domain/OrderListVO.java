package org.food.domain;

import java.sql.Date;

public class OrderListVO {
	
	private Integer ono;
	private Integer total_price;
	private Date regdate;
	private Date pickup_time;
	private String c_msg;
	private Integer sno;
	private String c_id;
	private Integer state_code;
	private Integer reviewstate;
	private String u_id;
	private String co_name;
	private String state_name;
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
	public Integer getSno() {
		return sno;
	}
	public void setSno(Integer sno) {
		this.sno = sno;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public Integer getState_code() {
		return state_code;
	}
	public void setState_code(Integer state_code) {
		this.state_code = state_code;
	}
	public Integer getReviewstate() {
		return reviewstate;
	}
	public void setReviewstate(Integer reviewstate) {
		this.reviewstate = reviewstate;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getCo_name() {
		return co_name;
	}
	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}
	public String getState_name() {
		return state_name;
	}
	public void setState_name(String state_name) {
		this.state_name = state_name;
	}
	
	@Override
	public String toString() {
		return "OrderListVO [ono=" + ono + ", total_price=" + total_price + ", regdate=" + regdate + ", pickup_time="
				+ pickup_time + ", c_msg=" + c_msg + ", sno=" + sno + ", c_id=" + c_id + ", state_code=" + state_code
				+ ", reviewstate=" + reviewstate + ", u_id=" + u_id + ", co_name=" + co_name + ", state_name="
				+ state_name + "]";
	}
	
}
