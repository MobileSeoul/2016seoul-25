package org.food.domain;

import java.util.Date;

public class MemberVO {
	
	private String c_id;
	private String c_pw;
	private String c_name;
	private String c_phone;
	private String c_mail;
	private String k_id;
	private String k_nick;
	private String profile_img;
	private String thumb_img;
	private Date regdate;
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
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_phone() {
		return c_phone;
	}
	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}
	public String getC_mail() {
		return c_mail;
	}
	public void setC_mail(String c_mail) {
		this.c_mail = c_mail;
	}
	public String getK_id() {
		return k_id;
	}
	public void setK_id(String k_id) {
		this.k_id = k_id;
	}
	public String getK_nick() {
		return k_nick;
	}
	public void setK_nick(String k_nick) {
		this.k_nick = k_nick;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getThumb_img() {
		return thumb_img;
	}
	public void setThumb_img(String thumb_img) {
		this.thumb_img = thumb_img;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "MemberVO [c_id=" + c_id + ", c_pw=" + c_pw + ", c_name=" + c_name + ", phone=" + c_phone + ", c_mail="
				+ c_mail + ", k_id=" + k_id + ", k_nick=" + k_nick + ", profile_img=" + profile_img + ", thumb_img="
				+ thumb_img + ", regdate=" + regdate + "]";
	}
	
	

}
