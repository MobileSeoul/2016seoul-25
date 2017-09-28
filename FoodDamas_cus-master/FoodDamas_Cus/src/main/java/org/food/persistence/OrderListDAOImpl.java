package org.food.persistence;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.OrderListVO;
import org.food.domain.OrderVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OrderListDAOImpl implements OrderListDAO {
	
	@Inject
	private SqlSessionTemplate sqlsession;
	
	@Override
	public List<String> readlist(OrderListVO vo) {
		return sqlsession.selectList("org.food.mapper.OrderListMapper.readlist", vo);
	}

	@Override
	public Integer pageCount(String c_id) {
		return sqlsession.selectOne("org.food.mapper.OrderListMapper.pageCount", c_id);
	}
	

}
