package org.food.service;

import java.util.List;

import org.food.domain.QnaVO;

public interface QnaService {
	
	public List<String> read(QnaVO vo);
	
	public Integer pageCount(String u_id) ;

	public void registerqna(QnaVO vo);

	public void updateanscnt(Integer qno);

	public void deleteqna(QnaVO vo);


}
