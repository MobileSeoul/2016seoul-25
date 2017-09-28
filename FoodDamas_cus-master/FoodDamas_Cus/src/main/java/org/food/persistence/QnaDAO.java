package org.food.persistence;

import java.util.List;

import org.food.domain.QnaVO;

public interface QnaDAO {
	
	
	public List<String> read(QnaVO vo);

	public Integer pageCount(String u_id);

	public void reisterqna(QnaVO vo);

	public void updateanscnt(Integer qno);

	public void deleteqna(QnaVO vo);





}
