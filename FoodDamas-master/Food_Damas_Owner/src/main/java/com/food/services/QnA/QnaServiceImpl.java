package com.food.services.QnA;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.food.domain.QnAVO;
import com.food.persistences.QnA.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Inject
	private QnaDAO dao;
	
	@Override
	public List<String> read(QnAVO vo) throws Exception {
		return dao.read(vo);		
	}

	@Override
	public QnAVO view(Integer qno) throws Exception {
		return dao.view(qno);		
	}

	@Override
	public Integer pageCount(String u_id) throws Exception {
		return dao.pageCount(u_id);		
	}

	@Override
	public List<String> readlist(String u_id) throws Exception{
		return dao.readlist(u_id);	
	}

	@Override
	public List<String> readview(Integer qno) throws Exception {
		return dao.readview(qno);
	

	}

	

}
