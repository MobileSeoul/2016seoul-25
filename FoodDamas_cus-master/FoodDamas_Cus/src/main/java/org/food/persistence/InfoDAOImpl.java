package org.food.persistence;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.InfoVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDAOImpl implements InfoDAO {
	
	
	@Inject
	private SqlSessionTemplate sqlsession;

	@Override
	public List<String> readlist(String u_id) throws Exception {
		return sqlsession.selectList("org.food.mapper.InfoMapper.readlist",u_id);

	}

	@Override
	public List<String> map(String u_id) throws Exception {
		return sqlsession.selectList("org.food.mapper.InfoMapper.map",u_id);

	}

}
