package org.food.service;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.MenuVO;
import org.food.persistence.MenuDAO;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService {

	@Inject
	private MenuDAO dao;
	
	
	@Override
	public List<MenuVO> select(String u_id) throws Exception {
		return dao.select(u_id);
	}


	@Override
	public MenuVO view(Integer mno) throws Exception {
		return dao.view(mno);
	}

}
