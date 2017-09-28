package com.food.persistences.Notice;

import java.util.List;

import com.food.domain.NoticeVO;




public interface NoticeDAO {
	
	public List<NoticeVO> readNotice(NoticeVO vo) throws Exception;
	
	public Integer pageCountnotice() throws Exception;

}
