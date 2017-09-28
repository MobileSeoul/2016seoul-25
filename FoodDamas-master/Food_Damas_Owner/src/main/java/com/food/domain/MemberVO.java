package com.food.domain;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {

	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_email;
	private String u_phone;
	private String u_profile_img;//프로필사진
	private MultipartFile file1; //이미지파일
	
	private Integer f_code;
	private String co_name;
	private long co_num;
	private String co_doc;//사업자번호 사진
	private MultipartFile file2; //사업자파일
	
	private String co_intro;
	private String sales_time;
	private Integer register_state;
	private Date register_date;
	private String sessionkey;
	private String sessionlimit;
	private Integer grade; //평점
	private Integer del_state;
	
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
	public String getU_profile_img() {
		return u_profile_img;
	}
	public void setU_profile_img(String u_profile_img) {
		this.u_profile_img = u_profile_img;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
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
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) {
		this.file2 = file2;
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
	public String getSessionkey() {
		return sessionkey;
	}
	public void setSessionkey(String sessionkey) {
		this.sessionkey = sessionkey;
	}
	public String getSessionlimit() {
		return sessionlimit;
	}
	public void setSessionlimit(String sessionlimit) {
		this.sessionlimit = sessionlimit;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	public Integer getDel_state() {
		return del_state;
	}
	public void setDel_state(Integer del_state) {
		this.del_state = del_state;
	}
	@Override
	public String toString() {
		return "MemberVO [u_id=" + u_id + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_email=" + u_email
				+ ", u_phone=" + u_phone + ", u_profile_img=" + u_profile_img + ", file1=" + file1 + ", f_code="
				+ f_code + ", co_name=" + co_name + ", co_num=" + co_num + ", co_doc=" + co_doc + ", file2=" + file2
				+ ", co_intro=" + co_intro + ", sales_time=" + sales_time + ", register_state=" + register_state
				+ ", register_date=" + register_date + ", sessionkey=" + sessionkey + ", sessionlimit=" + sessionlimit
				+ ", grade=" + grade + ", del_state=" + del_state + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
