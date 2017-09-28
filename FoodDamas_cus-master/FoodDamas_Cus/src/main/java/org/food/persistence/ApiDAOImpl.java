package org.food.persistence;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.ApiVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class ApiDAOImpl implements ApiDAO {
	
	@Inject
	private SqlSessionTemplate sqlsession;

	@Override
	public List<String> readlist(ApiVO vo) throws Exception {
		return sqlsession.selectList("org.food.mapper.ApiMapper.readlist",vo);
	}

}
