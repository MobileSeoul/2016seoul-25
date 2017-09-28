package org.food.persistence;

import org.food.domain.OrderVO;

public interface OrderDAO {
	
	public void insertOrder(OrderVO vo);
	
	public void insertOrderDetail(OrderVO vo);
	
	

}
