package org.food.domain;

import java.sql.Date;

public class TruckMemberVO {

	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_email;
	private String u_phone;
	private String co_name;
	private long co_num;
	private String co_doc;
	private String co_intro;
	private Integer register_state;
	private Date register_date;
	private String sales_time;
	private String u_profile_img;
	private Integer f_code;
	private Integer sno;
	
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
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	public String getCo_name() {
		return co_name;
	}
	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}
	public long getCo_num() {
		return co_num;
	}
	public void setCo_num(long co_num) {
		this.co_num = co_num;
	}
	public String getCo_doc() {
		return co_doc;
	}
	public void setCo_doc(String co_doc) {
		this.co_doc = co_doc;
	}
	public String getCo_intro() {
		return co_intro;
	}
	public void setCo_intro(String co_intro) {
		this.co_intro = co_intro;
	}
	public Integer getRegister_state() {
		return register_state;
	}
	public void setRegister_state(Integer register_state) {
		this.register_state = register_state;
	}
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	public String getSales_time() {
		return sales_time;
	}
	public void setSales_time(String sales_time) {
		this.sales_time = sales_time;
	}
	public String getU_profile_img() {
		return u_profile_img;
	}
	public void setU_profile_img(String u_profile_img) {
		this.u_profile_img = u_profile_img;
	}
	public Integer getF_code() {
		return f_code;
	}
	public void setF_code(Integer f_code) {
		this.f_code = f_code;
	}
	@Override
	public String toString() {
		return "TruckMemberVO [u_id=" + u_id + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_email=" + u_email
				+ ", u_phone=" + u_phone + ", co_name=" + co_name + ", co_num=" + co_num + ", co_doc=" + co_doc
				+ ", co_intro=" + co_intro + ", register_state=" + register_state + ", register_date=" + register_date
				+ ", sales_time=" + sales_time + ", u_profile_img=" + u_profile_img + ", f_code=" + f_code + ", sno="
				+ sno + "]";
	}

	
	
	
}
