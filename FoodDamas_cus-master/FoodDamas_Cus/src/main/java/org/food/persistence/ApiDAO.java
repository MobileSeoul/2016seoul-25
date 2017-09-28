package org.food.persistence;

import java.util.List;

import org.food.domain.ApiVO;

public interface ApiDAO {
	
	public List<String> readlist(ApiVO vo) throws Exception; 

}
