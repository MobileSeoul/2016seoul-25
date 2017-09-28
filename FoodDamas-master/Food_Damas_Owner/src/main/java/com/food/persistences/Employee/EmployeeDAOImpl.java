package com.food.persistences.Employee;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.food.domain.EmployeeVO;

@Repository
public class EmployeeDAOImpl implements EmployeeDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace ="com.food.mapper.EmployeeMapper";
	@Override
	public EmployeeVO getLogin(HashMap<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getUserLogin",map);
	}

}
