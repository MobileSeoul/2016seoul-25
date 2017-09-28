package com.food.services.QnA;

import java.util.List;

import com.food.domain.QnAVO;




public interface QnaService {
	
	public List<String> read(QnAVO vo) throws Exception;

	public List<String> readlist(String u_id) throws Exception;

	public List<String> readview(Integer qno) throws Exception;

	
	public QnAVO view(Integer qno) throws Exception;
	
	public Integer pageCount(String u_id) throws Exception;



}
