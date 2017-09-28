package org.food.persistence;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class AnswerDAOImpl implements AnswerDAO {
	
	
	@Inject
	private SqlSessionTemplate sqlsession;

	@Override
	public List<String> readlist(Integer qno) throws Exception {
		return sqlsession.selectList("org.food.mapper.AnswerMapper.readlist",qno);

	}

}
