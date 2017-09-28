package org.food.service;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.QnaVO;
import org.food.persistence.QnaDAO;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Inject
	private QnaDAO dao;
	
	@Override
	public List<String> read(QnaVO vo) {
		return dao.read(vo);
	}
	
	@Override
	public Integer pageCount(String u_id) {
		return dao.pageCount(u_id);
	}

	@Override
	public void registerqna(QnaVO vo) {
		dao.reisterqna(vo);
		
	}

	@Override
	public void updateanscnt(Integer qno) {
		dao.updateanscnt(qno);
		
	}

	@Override
	public void deleteqna(QnaVO vo) {
		dao.deleteqna(vo);
		
	}
	

}
