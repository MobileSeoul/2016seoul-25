package org.food.service;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.QnaVO;
import org.food.persistence.AnswerDAO;
import org.food.persistence.QnaDAO;
import org.springframework.stereotype.Service;

@Service
public class AnswerServiceImpl implements AnswerService {
	
	
	@Inject
	private AnswerDAO dao;
	
	@Override
	public List<String> readlist(Integer qno) throws Exception {
		return dao.readlist(qno);
	}
	
	
	
	

}
