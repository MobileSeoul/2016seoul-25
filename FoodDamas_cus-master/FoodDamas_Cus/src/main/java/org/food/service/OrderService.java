package org.food.service;

import org.food.domain.OrderVO;
import org.springframework.stereotype.Service;

@Service
public interface OrderService {
	public void insertOrder(OrderVO vo);

}
