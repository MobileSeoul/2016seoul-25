package org.food.persistence;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.QnaVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class QnaDAOImpl implements QnaDAO {

	@Inject
	private SqlSessionTemplate sqlsession;
	
	@Override
	public List<String> read(QnaVO vo) {
		return sqlsession.selectList("org.food.mapper.QnaMapper.read",vo);

	}
	
	@Override
	public Integer pageCount(String u_id) {
		return sqlsession.selectOne("org.food.mapper.QnaMapper.pageCount", u_id);
	}

	@Override
	public void reisterqna(QnaVO vo) {
		sqlsession.insert("org.food.mapper.QnaMapper.registerqna", vo);
		
	}



	@Override
	public void updateanscnt(Integer qno) {
		sqlsession.update("org.food.mapper.QnaMapper.updateanscnt",qno);

	}

	@Override
	public void deleteqna(QnaVO vo) {
		sqlsession.delete("org.food.mapper.QnaMapper.deleteqna",vo);
		
	}
}
