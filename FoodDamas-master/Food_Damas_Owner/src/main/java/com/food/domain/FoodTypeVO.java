package com.food.domain;

public class FoodTypeVO {
	private Integer f_code;
	private String f_type;
	public Integer getF_code() {
		return f_code;
	}
	public void setF_code(Integer f_code) {
		this.f_code = f_code;
	}
	public String getF_type() {
		return f_type;
	}
	public void setF_type(String f_type) {
		this.f_type = f_type;
	}
	@Override
	public String toString() {
		return "FoodTypeVO [f_code=" + f_code + ", f_type=" + f_type + "]";
	}
	
	
}
