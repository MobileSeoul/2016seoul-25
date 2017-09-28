package com.food.domain;

import java.util.Date;

public class EmployeeVO {
	private String emp_user;
	private String emp_pass;
	private Date last_login;
	public String getEmp_user() {
		return emp_user;
	}
	public void setEmp_user(String emp_user) {
		this.emp_user = emp_user;
	}
	public String getEmp_pass() {
		return emp_pass;
	}
	public void setEmp_pass(String emp_pass) {
		this.emp_pass = emp_pass;
	}
	public Date getLast_login() {
		return last_login;
	}
	public void setLast_login(Date last_login) {
		this.last_login = last_login;
	}
	@Override
	public String toString() {
		return "EmployeeVO [emp_user=" + emp_user + ", emp_pass=" + emp_pass + ", last_login=" + last_login + "]";
	}
	
	
}
