package com.food.services.Menu;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.food.domain.MenuVO;
import com.food.persistences.Menu.MenuDAO;

@Service
public class MenuServiceImpl implements MenuService {

	@Inject
	private MenuDAO dao;
	
	@Override
	public void insert(MenuVO vo) throws Exception {
		dao.insert(vo);

	}

	@Override
	public List<MenuVO> select(String u_id) throws Exception {
		return dao.select(u_id);
	}

	@Override
	public void update(MenuVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void updateState(MenuVO vo) throws Exception {
		dao.updateState(vo);
	}

	@Override
	public List<MenuVO> list() throws Exception {
		return dao.getTestList();
	}

	@Override
	public void delete(MenuVO vo) throws Exception {
		dao.delete(vo);
	}

}
