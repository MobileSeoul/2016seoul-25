package org.food.service;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.TruckMemberVO;
import org.food.domain.PositionVO;
import org.food.persistence.TruckDAO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class TruckServiceImpl implements TruckService {
	@Inject
	TruckDAO dao;

	@Override
	public List<Object> orderByDistance(PositionVO vo) {
		// TODO Auto-generated method stub
		return dao.orderByDistance(vo);
	}

	@Override
	public Integer distanceLength(PositionVO vo) {
		// TODO Auto-generated method stub
		return dao.distanceLength(vo);
	}

	@Override
	public List<Object> orderByGrade(PositionVO vo) {
		// TODO Auto-generated method stub
		return dao.orderByGrade(vo);
	}

	@Override
	public Integer gradeLength(PositionVO vo) {
		// TODO Auto-generated method stub
		return dao.gradeLength(vo);
	}

	@Override
	public List<Object> orderByReview(PositionVO vo) {
		// TODO Auto-generated method stub
		return dao.orderByReview(vo);
	}

	@Override
	public Integer reviewLength(PositionVO vo) {
		// TODO Auto-generated method stub
		return dao.reviewLength(vo);
	}

}
