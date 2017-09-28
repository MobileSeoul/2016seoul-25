package org.food.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.food.domain.OrderDetailVO;
import org.springframework.stereotype.Repository;


@Repository
public class OrderDetailDAOImpl implements OrderDetailDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace ="org.food.mapper.OrderDetailMapper";	

	
	@Override
	public List<OrderDetailVO> readDetail(Integer ono) {
		
		return session.selectList(namespace+".readDetail", ono);
	}





}
