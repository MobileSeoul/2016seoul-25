package com.food.services.Answer;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.food.domain.AnswerVO;
import com.food.persistences.Answer.AnswerDAO;

@Service
public class AnswerServicerImpl implements AnswerService {
	
	@Inject
	private AnswerDAO dao;
	

	@Override
	public List<String> readanswer(Integer qno) throws Exception  {
		return dao.readanswer(qno);		
		
	}
	
	@Override
	public void registeranswer(AnswerVO voa) throws Exception  {
		dao.registeranswer(voa);
	}

	@Override
	public AnswerVO viewanswer(Integer ano) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateanswer(AnswerVO voa) throws Exception{
		dao.updateanswer(voa);
	}

	@Override
	public Integer pageCountanswer() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void deleteanswer(AnswerVO voa) throws Exception {		
		dao.deleteanswer(voa);
	}



	@Override
	public void updateanscnt(Integer qno) throws Exception {
		dao.updateanscnt(qno);
	}
}
