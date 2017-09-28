package org.food.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.food.domain.OrderVO;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace ="org.food.mapper.OrderMapper";	

	
	@Override
	public void insertOrder(OrderVO vo) {
		
		session.insert(namespace+".insertOrder", vo);

	}


	@Override
	public void insertOrderDetail(OrderVO vo) {

		session.insert(namespace+".insertOrderDetail", vo);
		
	}

}
