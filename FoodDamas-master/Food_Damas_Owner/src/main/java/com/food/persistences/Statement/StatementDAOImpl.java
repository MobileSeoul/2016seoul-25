package com.food.persistences.Statement;

import java.util.List;

import javax.inject.Inject;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.food.domain.SaleVO;

@Repository

public class StatementDAOImpl implements StatementDAO {

	@Inject
	private SqlSessionTemplate sqlsession;
	
	private static final String namespace =
			"com.food.mapper.StatementMapper";

	@Override
	public List<SaleVO> orderByLocation(String u_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".location", u_id);
	}

	@Override
	public List<SaleVO> orderByDay(String u_id) {
		return sqlsession.selectList(namespace+".day", u_id);
	}

	@Override
	public List<SaleVO> orderByMonth(String u_id) {
		return sqlsession.selectList(namespace+".month", u_id);
	}

	@Override
	public List<SaleVO> orderByMenu(String u_id) {
		return sqlsession.selectList(namespace+".menu", u_id);
	}
	

	
}
