package org.food.persistence;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.AnswerVO;
import org.food.domain.ReviewVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Inject
	private SqlSessionTemplate sqlsession;
	
	@Override
	public List<String> readlist(ReviewVO vo) {
		return sqlsession.selectList("org.food.mapper.ReviewMapper.readlist",vo);

	}
		
	@Override
	public Integer pageCount(String u_id) {
		return sqlsession.selectOne("org.food.mapper.ReviewMapper.pageCount",u_id);
	}
	
	
	
	@Override
	public void registerreview(ReviewVO vo) {
		sqlsession.insert("org.food.mapper.ReviewMapper.registerreview",vo);

		
		
	}

	@Override
	public void reviewavg(ReviewVO vo) {
		sqlsession.update("org.food.mapper.ReviewMapper.reviewavg",vo);
		
	}


	

}
