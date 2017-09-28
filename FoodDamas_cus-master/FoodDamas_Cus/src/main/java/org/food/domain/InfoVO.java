package org.food.domain;

public class InfoVO {
	
	private String u_id;
	private String u_name;
	private String u_email;
	private String u_phone;
	private Integer f_code;
	private String co_name;
	private Long co_num;
	private String co_intro;
	private String sales_time;
	private double grade;
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
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
	public Integer getF_code() {
		return f_code;
	}
	public void setF_code(Integer f_code) {
		this.f_code = f_code;
	}
	public String getCo_name() {
		return co_name;
	}
	public void setCo_name(String co_name) {
		this.co_name = co_name;
	}
	public Long getCo_num() {
		return co_num;
	}
	public void setCo_num(Long co_num) {
		this.co_num = co_num;
	}
	public String getCo_intro() {
		return co_intro;
	}
	public void setCo_intro(String co_intro) {
		this.co_intro = co_intro;
	}
	public String getSales_time() {
		return sales_time;
	}
	public void setSales_time(String sales_time) {
		this.sales_time = sales_time;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	
	
	@Override
	public String toString() {
		return "InfoVO [u_id=" + u_id + ", u_name=" + u_name + ", u_email=" + u_email + ", u_phone=" + u_phone
				+ ", f_code=" + f_code + ", co_name=" + co_name + ", co_num=" + co_num + ", co_intro=" + co_intro
				+ ", sales_time=" + sales_time + ", grade=" + grade + "]";
	}

	
	
	

}
