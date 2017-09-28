package com.food.services.Menu;

import java.util.List;

import com.food.domain.MenuVO;

public interface MenuService {
	
	public void insert(MenuVO vo)throws Exception;
	
	public List<MenuVO> select(String u_id)throws Exception;
	
	public void update(MenuVO vo)throws Exception;
	
	public void updateState(MenuVO vo)throws Exception;
	
	public List<MenuVO> list() throws Exception;
	
	public void delete(MenuVO vo)throws Exception;

}
