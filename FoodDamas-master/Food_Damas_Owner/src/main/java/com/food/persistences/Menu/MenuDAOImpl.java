package com.food.persistences.Menu;

import java.util.List;
import javax.inject.Inject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import com.food.domain.MenuVO;

@Repository
public class MenuDAOImpl implements MenuDAO {

	@Inject
	private SqlSessionTemplate sqlsession;
	
	private static final String namespace =
			"com.food.mapper.MenuMapper";
	
	@Override
	public void insert(MenuVO vo) throws Exception {
		sqlsession.insert(namespace+".insert",vo);

	}

	@Override
	public List<MenuVO> select(String u_id) throws Exception {
		return sqlsession.selectList(namespace+".select",u_id);
		
	}

	@Override
	public void update(MenuVO vo) throws Exception {
		sqlsession.update(namespace+".update", vo);
		
	}

	@Override
	public void updateState(MenuVO vo) throws Exception {
		sqlsession.update(namespace+".updateState",vo);
		
	}

	@Override
	public List<MenuVO> getTestList() throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".test");
	}

	@Override
	public void delete(MenuVO vo) throws Exception {
		sqlsession.delete(namespace+".delete", vo);
		
	}

	@Override
	public MenuVO selectOne(MenuVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namespace+".selectOne",vo);
	}

}
