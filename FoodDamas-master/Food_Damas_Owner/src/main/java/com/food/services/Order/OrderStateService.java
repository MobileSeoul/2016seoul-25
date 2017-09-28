package com.food.services.Order;

import java.util.List;

import com.food.domain.OrderStateVO;

public interface OrderStateService {
	public List<OrderStateVO> listOrderState()throws Exception;
	public OrderStateVO getOrderStateByID(Integer state_code) throws Exception;
	public void createOrderState(OrderStateVO vo) throws Exception;
	public void updateOrderState(OrderStateVO vo) throws Exception;
	public void deleteOrderState(Integer state_code) throws Exception;
}
