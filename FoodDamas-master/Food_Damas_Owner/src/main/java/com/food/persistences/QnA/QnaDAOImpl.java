package com.food.persistences.QnA;

import java.util.List;

import javax.inject.Inject;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.food.domain.QnAVO;

@Repository
public class QnaDAOImpl implements QnaDAO {
	
	@Inject
	private SqlSessionTemplate sqlsession;
	
	private static final String namespace =
			"com.food.mapper.QnaMapper";
	
	@Override
	public List<String> readview(Integer qno) throws Exception {
		return sqlsession.selectList(namespace+".readview",qno);
	}
	

	@Override
	public QnAVO view(Integer qno) throws Exception {
		return sqlsession.selectOne(namespace+".view",qno);
	}

	@Override
	public Integer pageCount(String u_id) throws Exception {
		return sqlsession.selectOne(namespace+".pageCount",u_id);
	}

	@Override
	public List<QnAVO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".list");
	}
	
	@Override
	public List<String> readlist(String u_id){
		return sqlsession.selectList(namespace+".read",u_id);

	}

	@Override
	public List<String> read(QnAVO vo) throws Exception {
		return sqlsession.selectList(namespace+".read",vo);

	}

}
