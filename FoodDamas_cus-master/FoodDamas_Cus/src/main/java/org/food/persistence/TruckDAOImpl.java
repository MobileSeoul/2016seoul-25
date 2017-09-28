package org.food.persistence;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.TruckMemberVO;
import org.food.domain.PositionVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TruckDAOImpl implements TruckDAO {
	@Inject
	private SqlSessionTemplate sqlsession;

	@Override
	public List<Object> orderByDistance(PositionVO vo) {
		return sqlsession.selectList("org.food.service.TruckListMapper.distance", vo);
	}

	@Override
	public Integer distanceLength(PositionVO vo) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("org.food.service.TruckListMapper.distanceLength", vo);
	}

	@Override
	public List<Object> orderByGrade(PositionVO vo) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("org.food.service.TruckListMapper.grade", vo);
	}

	@Override
	public Integer gradeLength(PositionVO vo) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("org.food.service.TruckListMapper.gradeLength", vo);
	}

	@Override
	public List<Object> orderByReview(PositionVO vo) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("org.food.service.TruckListMapper.review", vo);
	}

	@Override
	public Integer reviewLength(PositionVO vo) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("org.food.service.TruckListMapper.reviewLength", vo);
	}

}
