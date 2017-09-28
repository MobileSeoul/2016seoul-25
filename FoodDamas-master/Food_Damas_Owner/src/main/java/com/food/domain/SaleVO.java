package com.food.domain;

import java.sql.Time;

import java.util.Date;

public class SaleVO {
	private Integer sno;
	private String u_id;
	private String location;
	private Double lat;
	private Double lng;
	private Time open_time;
	private Time close_time;
	private Date work_date;
	private Integer sales_state;
	public Integer getSno() {
		return sno;
	}
	public void setSno(Integer sno) {
		this.sno = sno;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public Double getLng() {
		return lng;
	}
	public void setLng(Double lng) {
		this.lng = lng;
	}
	public Time getOpen_time() {
		return open_time;
	}
	public void setOpen_time(Time open_time) {
		this.open_time = open_time;
	}
	public Time getClose_time() {
		return close_time;
	}
	public void setClose_time(Time close_time) {
		this.close_time = close_time;
	}
	public Date getWork_date() {
		return work_date;
	}
	public void setWork_date(Date work_date) {
		this.work_date = work_date;
	}
	public Integer getSales_state() {
		return sales_state;
	}
	public void setSales_state(Integer sales_state) {
		this.sales_state = sales_state;
	}
	@Override
	public String toString() {
		return "SalesVO [sno=" + sno + ", u_id=" + u_id + ", location=" + location + ", lat=" + lat + ", lng=" + lng
				+ ", open_time=" + open_time + ", close_time=" + close_time + ", work_date=" + work_date
				+ ", sales_state=" + sales_state + "]";
	}
	
	
}
