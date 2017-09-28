package org.food.persistence;

import java.util.List;

import org.food.domain.OrderDetailVO;
import org.food.domain.OrderListVO;

public interface OrderDetailDAO {
	
	public List<OrderDetailVO> readDetail(Integer ono);


}
