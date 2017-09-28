package com.food.services.Notice;

import java.util.List;

import javax.inject.Inject;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.food.domain.NoticeVO;
import com.food.persistences.Notice.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private SqlSessionTemplate sqlsession;
	
	@Inject
	private  NoticeDAO dao;
	
	
	@Override
	public List<String> readnotice(NoticeVO vo) {
		return sqlsession.selectList("com.food.mapper.NoticeMapper.readNotice",vo);

	}	
	

	@Override
	public Integer pageCountnotice() {
		return sqlsession.selectOne("com.food.mapper.NoticeMapper.pageCountnotice");

	}


}
