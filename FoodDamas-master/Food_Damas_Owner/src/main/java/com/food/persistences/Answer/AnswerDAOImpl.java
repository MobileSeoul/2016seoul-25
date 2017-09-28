package com.food.persistences.Answer;

import java.util.List;

import javax.inject.Inject;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.food.domain.AnswerVO;

@Repository
public class AnswerDAOImpl implements AnswerDAO {
	
	
	@Inject
	private SqlSessionTemplate sqlsession;
	
	private static final String namespace =
			"com.food.mapper.AnswerMapper";
	
	@Override
	public List<String> readanswer(Integer qno) throws Exception {
		return sqlsession.selectList(namespace+".readanswer",qno);
	}


	
	@Override
	public void registeranswer(AnswerVO voa) throws Exception {
		sqlsession.insert(namespace+".registeranswer", voa);

	}

	@Override
	public AnswerVO viewanswer(Integer ano) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateanswer(AnswerVO voa) throws Exception {
		sqlsession.update(namespace+".updateanswer",voa);

	}

	@Override
	public Integer pageCountanswer() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void deleteanswer(AnswerVO voa) throws Exception {
		sqlsession.delete(namespace+".deleteanswer",voa);
		
	}



	@Override
	public void updateanscnt(Integer qno) throws Exception {
		// TODO Auto-generated method stub
		sqlsession.update(namespace+".anscnt",qno);

	}




}
