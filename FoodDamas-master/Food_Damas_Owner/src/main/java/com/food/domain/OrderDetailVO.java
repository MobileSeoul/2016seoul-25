package com.food.domain;

public class OrderDetailVO {
	private Integer odno;
	private Integer quantity;
	private MenuVO menu;
	public Integer getOdno() {
		return odno;
	}
	public void setOdno(Integer odno) {
		this.odno = odno;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public MenuVO getMenu() {
		return menu;
	}
	public void setMenu(MenuVO menu) {
		this.menu = menu;
	}
	@Override
	public String toString() {
		return "OrderDetailVO [odno=" + odno + ", quantity=" + quantity + ", menu=" + menu + "]";
	}
	
	
}
