package org.food.service;

import java.util.List;

import org.food.domain.OrderDetailVO;
import org.food.domain.OrderListVO;

public interface OrderListService {
	
	public List<String> readlist(OrderListVO vo);
	
	public Integer pageCount(String c_id);
	
	
	//orderDetail list
	
	public List<OrderDetailVO> readDetail(Integer ono);


}
