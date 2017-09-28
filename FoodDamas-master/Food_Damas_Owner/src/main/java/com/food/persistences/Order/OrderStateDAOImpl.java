package com.food.persistences.Order;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.food.domain.OrderStateVO;

@Repository
public class OrderStateDAOImpl implements OrderStateDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace ="com.food.mapper.OrderStateMapper";
	
	@Override
	public List<OrderStateVO> listOrderState() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getListOrderState");
	}

	@Override
	public OrderStateVO getOrderStateByID(Integer state_code) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getOrderStateByID",state_code);
	}

	@Override
	public void createOrderState(OrderStateVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".createOrderState",vo);
	}

	@Override
	public void updateOrderState(OrderStateVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+".updateOrderState",vo);
		
	}

	@Override
	public void deleteOrderState(Integer state_code) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace+".deleteOrderState",state_code);
	}

}
