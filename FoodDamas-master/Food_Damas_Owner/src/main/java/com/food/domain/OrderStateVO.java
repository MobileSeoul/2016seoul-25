package com.food.domain;

public class OrderStateVO {
	private Integer state_code;
	private String state_name;
	public Integer getState_code() {
		return state_code;
	}
	public void setState_code(Integer state_code) {
		this.state_code = state_code;
	}
	public String getState_name() {
		return state_name;
	}
	public void setState_name(String state_name) {
		this.state_name = state_name;
	}
	@Override
	public String toString() {
		return "OrderStateVO [state_code=" + state_code + ", state_name=" + state_name + "]";
	}
	
	
}
