package com.food.persistences.Order;


import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.food.domain.OrderDetailVO;
import com.food.domain.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespaceOrder =
			"com.food.mapper.OrderMapper";
	private static final String namespaceOrderDetail =
			"com.food.mapper.OrderDetailMapper";
	
/*	@Override
	public List<OrderVO> getListOrderByFTID(String ft_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
*/
	@Override
	public List<OrderVO> getListOrderByCustID(String c_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespaceOrder+".getListOrderByCustID",c_id);
	}
	@Override
	public List<OrderVO> getListOrderBySaleID(Integer sno) throws Exception{
		return sqlSession.selectList(namespaceOrder+".getListOrderBySaleID",sno);
	}

	@Override
	public OrderVO getOrderByID(Integer ono) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespaceOrder+".getOneOrderByOrderID",ono);
	}

	@Override
	public void insertOrder(OrderVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespaceOrder+".createOrder",vo);
	}

	@Override
	public Integer getCurrentInsertID() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespaceOrder+".getLastInsertID");
	}

	@Override
	public void updateOrder(OrderVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespaceOrder+".updateOrder",vo);
	}

	@Override
	public void updateOrderState(HashMap<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.update(namespaceOrder+".updateState",map);
		
	}
	@Override
	public List<OrderDetailVO> getListOrderDetailByOrderID(Integer ono) throws Exception{
		return sqlSession.selectList(namespaceOrderDetail+".getOrderDetailByOrderID",ono);
	}

	@Override
	public void insertOrderDetail(OrderDetailVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(namespaceOrderDetail+".addOrderDetail",vo);
	}

	@Override
	public void updateOrderDetail(OrderDetailVO vo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(namespaceOrderDetail+".updateOrderDetail",vo);
	}
	@Override
	public List<OrderVO> getFinishedOrder(HashMap<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespaceOrder+".getListFinishedOrder",map);
	}
	@Override
	public List<OrderVO> getListOrderBySaleIDWithSearchString(HashMap<String, Object> searchObj) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespaceOrder+".getListOrderBySaleIDWithSearch",searchObj);
	}
	@Override
	public List<OrderVO> getListOrderBySaleIDWithOno(HashMap<String, Integer> searchObj) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespaceOrder+".getListOrderBySaleIDWithSearchInt",searchObj);
	}
	

}
