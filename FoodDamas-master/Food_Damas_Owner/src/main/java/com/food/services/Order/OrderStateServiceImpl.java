package com.food.services.Order;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.food.domain.OrderStateVO;
import com.food.persistences.Order.OrderStateDAO;

@Service
public class OrderStateServiceImpl implements OrderStateService{

	@Inject
	private OrderStateDAO dao;
	
	@Override
	public List<OrderStateVO> listOrderState() throws Exception {
		// TODO Auto-generated method stub
		return dao.listOrderState();
	}

	@Override
	public OrderStateVO getOrderStateByID(Integer state_code) throws Exception {
		// TODO Auto-generated method stub
		return dao.getOrderStateByID(state_code);
	}

	@Override
	public void createOrderState(OrderStateVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.createOrderState(vo);
	}

	@Override
	public void updateOrderState(OrderStateVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateOrderState(vo);
	}

	@Override
	public void deleteOrderState(Integer state_code) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteOrderState(state_code);
	}

}
