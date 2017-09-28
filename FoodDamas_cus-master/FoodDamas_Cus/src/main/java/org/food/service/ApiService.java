package org.food.service;

import java.util.List;

import org.food.domain.ApiVO;

public interface ApiService {
	
	public List<String> readlist(ApiVO vo) throws Exception;

}
