package org.food.persistence;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.MenuVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MenuDAOImpl implements MenuDAO {

	@Inject
	private SqlSessionTemplate sqlsession;
	
	@Override
	public List<MenuVO> select(String u_id) throws Exception {
		return sqlsession.selectList("org.food.persistence.MenuMapper.select", u_id);
	}

	@Override
	public MenuVO view(Integer mno) throws Exception {
		return sqlsession.selectOne("org.food.persistence.MenuMapper.view",mno);
	}

}
