package org.food.service;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.ReviewVO;
import org.food.persistence.ReviewDAO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {

	
	@Inject
	private SqlSessionTemplate sqlsession;
	
	@Inject
	private ReviewDAO dao;
	
	
	@Override
	public List<String> readlist  (ReviewVO vo){
		return dao.readlist(vo);
	}
	
	@Override
	public Integer pageCount(String u_id)  {
		return dao.pageCount(u_id);
	}
	
	
	
	@Override
	public void registerreview(ReviewVO vo) {
		dao.registerreview(vo);
		dao.reviewavg(vo);

	}
	

}
