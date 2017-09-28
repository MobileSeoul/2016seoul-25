package org.food.service;

import java.util.List;

import org.food.domain.ReviewVO;

public interface ReviewService {
	
	public List<String> readlist(ReviewVO vo);

	public Integer pageCount(String u_id) ;

	public void registerreview(ReviewVO vo) ;
	
	//public void reviewavg(ReviewVO vo) ; 


}
