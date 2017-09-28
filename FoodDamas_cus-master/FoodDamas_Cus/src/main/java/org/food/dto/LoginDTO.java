package org.food.dto;

public class LoginDTO {
	private String c_id;
	private String c_pw;
	private boolean useCookie;
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
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	@Override
	public String toString() {
		return "LoginDTO [c_id=" + c_id + ", c_pw=" + c_pw + ", useCookie=" + useCookie + "]";
	}
	
}
