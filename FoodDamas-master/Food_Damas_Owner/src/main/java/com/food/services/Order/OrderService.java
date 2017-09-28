package com.food.services.Order;

import java.util.HashMap;
import java.util.List;

import com.food.domain.OrderDetailVO;
import com.food.domain.OrderVO;

public interface OrderService {
	public List<OrderVO> getListOrderByCustID(String c_id)throws Exception;
	public List<OrderVO> getListOrderBySaleID(Integer sno) throws Exception;
	public List<OrderVO> getListOrderBySaleIDWithSearchString(HashMap<String,Object> searchObj) throws Exception;
	public List<OrderVO> getListOrderBySaleIDWithOno(HashMap<String,Integer> searchObj) throws Exception;
	public List<OrderVO> getFinishedOrder(HashMap<String,Object> map) throws Exception;
	public OrderVO getOrderByID(Integer ono) throws Exception;
	public void insertOrder(OrderVO vo) throws Exception;
	public Integer getCurrentInsertID() throws Exception;
	public void updateOrder(OrderVO vo) throws Exception;
	public void updateOrderState(HashMap<String,Object> map) throws Exception;
	public List<OrderDetailVO> getListOrderDetailByOrderID(Integer ono) throws Exception;
	public void insertOrderDetail(OrderDetailVO vo) throws Exception;
	public void updateOrderDetail(OrderDetailVO vo) throws Exception;
}
