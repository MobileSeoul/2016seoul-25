package com.food.persistences.Order;

import java.util.*;

import com.food.domain.OrderStateVO;

public interface OrderStateDAO {
	public List<OrderStateVO> listOrderState()throws Exception;
	public OrderStateVO getOrderStateByID(Integer state_code) throws Exception;
	public void createOrderState(OrderStateVO vo) throws Exception;
	public void updateOrderState(OrderStateVO vo) throws Exception;
	public void deleteOrderState(Integer state_code) throws Exception;
	
}
