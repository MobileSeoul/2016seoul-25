package org.food.persistence;

import java.util.List;

import org.food.domain.OrderListVO;

public interface OrderListDAO {
	
	public List<String> readlist(OrderListVO vo);
	
	public Integer pageCount(String c_id);


}
