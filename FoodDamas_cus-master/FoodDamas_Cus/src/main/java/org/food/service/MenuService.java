package org.food.service;

import java.util.List;

import org.food.domain.MenuVO;

public interface MenuService {

	public List<MenuVO> select(String u_id)throws Exception;
	
	public MenuVO view(Integer mno)throws Exception;
	
}
