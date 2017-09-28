package org.food.service;

import javax.inject.Inject;

import org.food.domain.OrderVO;
import org.food.persistence.CartDAO;
import org.food.persistence.OrderDAO;
import org.food.persistence.TruckDAO;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {


	@Inject
	private OrderDAO dao;
	
	@Inject CartDAO cartDao;
	
	@Override
	public void insertOrder(OrderVO vo) {
		
		dao.insertOrder(vo);
		dao.insertOrderDetail(vo);
		cartDao.updateCart(vo.getC_id());
	}

}
