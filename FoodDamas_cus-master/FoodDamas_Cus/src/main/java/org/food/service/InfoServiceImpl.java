package org.food.service;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.InfoVO;
import org.food.persistence.InfoDAO;
import org.springframework.stereotype.Service;


@Service
public class InfoServiceImpl implements InfoService {
	
	
	@Inject
	private InfoDAO dao;

	@Override
	public List<String> readlist(String u_id) throws Exception {
		return dao.readlist(u_id);
		
	}

	@Override
	public List<String> map(String u_id) throws Exception {
		return dao.map(u_id);
	}

}
