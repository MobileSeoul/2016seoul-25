package com.food.persistences.QnA;

import java.util.List;



import com.food.domain.QnAVO;


public interface QnaDAO {
	
	public List<String> read(QnAVO vo) throws Exception;
	
	public QnAVO view(Integer qno) throws Exception;
	
	public List<String> readlist(String u_id) throws Exception;
	
	public Integer pageCount(String u_id) throws Exception;
	
	public List<QnAVO> list() throws Exception;

	public List<String> readview(Integer qno) throws Exception;
}
