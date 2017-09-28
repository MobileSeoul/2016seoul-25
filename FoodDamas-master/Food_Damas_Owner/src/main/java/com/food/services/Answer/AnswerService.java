package com.food.services.Answer;

import java.util.List;

import com.food.domain.AnswerVO;



public interface AnswerService {
	
	public List<String> readanswer(Integer qno) throws Exception;
	
	public void registeranswer(AnswerVO voa) throws Exception;
	
	public AnswerVO viewanswer(Integer ano) throws Exception;
	
	public void updateanswer(AnswerVO voa) throws Exception;
	
	public void deleteanswer(AnswerVO voa) throws Exception;
	
	public Integer pageCountanswer() throws Exception;

	public void updateanscnt (Integer qno) throws Exception; 

	
	
}
