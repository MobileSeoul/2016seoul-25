package org.food.persistence;

import java.util.List;
import org.food.domain.MenuVO;

public interface MenuDAO {
	//메뉴 뿌려줄거야
	public List<MenuVO> select(String u_id)throws Exception;
	//메뉴 하나하나 뿌려보기
	public MenuVO view(Integer mno)throws Exception;
}
