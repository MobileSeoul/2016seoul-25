package com.food.services.Notice;

import java.util.List;

import com.food.domain.NoticeVO;

public interface NoticeService {
	
	public List<String> readnotice(NoticeVO vo);

	public Integer pageCountnotice() ;

}
