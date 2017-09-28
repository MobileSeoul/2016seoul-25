package org.food.persistence;

import java.util.List;

public interface AnswerDAO {
	
	public List<String> readlist(Integer qno) throws Exception ;

}
