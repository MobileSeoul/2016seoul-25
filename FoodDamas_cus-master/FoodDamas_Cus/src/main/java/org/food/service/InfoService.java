package org.food.service;

import java.util.List;

import org.food.domain.InfoVO;

public interface InfoService {
	
	public List<String> readlist(String u_id) throws Exception;
	
	public List<String> map(String u_id) throws Exception;

}
