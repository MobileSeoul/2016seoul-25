package com.food.persistences.Sales;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import com.food.domain.SaleVO;

@Repository
public class SalesDAOImpl implements SalesDAO {

	@Inject
	private SqlSessionTemplate sqlsession;
	
	private static final String namespace =
			"com.food.mapper.SaleMapper";
	
	@Override
	public void insert(SaleVO vo) {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace+".insert",vo);

	}

	@Override
	public List<SaleVO> read(String u_id) {
		// TODO Auto-generated method stub
		return 	sqlsession.selectList(namespace+".read",u_id);
	}

	@Override
	public void update(String u_id) {
		// TODO Auto-generated method stub
		sqlsession.update(namespace+".update",u_id);


	}
	@Override
	public SaleVO readSalesOne(String u_id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".readOne", u_id);
	}

	@Override
	public void insertFake(String u_id) {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace+".insertFake",u_id);

	}

	@Override
	public int getLastedInsertByUID(String u_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".getLastedInsertByUID",u_id);
	}

	@Override
	public void updateSale(HashMap<String, Object> mapObj) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(namespace+".updateSale",mapObj);
	}

	@Override
	public int getState(int sno) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".getState",sno);
	}

	@Override
	public void closeTruck(int sno) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(namespace+".closeTruck",sno);
	}

}
