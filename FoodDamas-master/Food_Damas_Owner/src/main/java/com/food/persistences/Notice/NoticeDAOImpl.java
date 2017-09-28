package com.food.persistences.Notice;

import java.util.List;

import javax.inject.Inject;

import com.food.domain.NoticeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	private SqlSessionTemplate sqlsession;
	
	
	@Override
	public List<NoticeVO> readNotice(NoticeVO vo) throws Exception {
		// TODO Auto-generated method stub
		return sqlsession.selectList("com.food.mapper.NoticeMapper.readNotice",vo);
	}


	@Override
	public Integer pageCountnotice() throws Exception {
		return sqlsession.selectOne("com.food.mapper.NoticeMapper.pageCountnotice");

	}

}
