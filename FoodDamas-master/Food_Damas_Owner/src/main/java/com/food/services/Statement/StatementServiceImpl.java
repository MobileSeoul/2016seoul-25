package com.food.services.Statement;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.food.domain.SaleVO;
import com.food.persistences.Statement.StatementDAO;

@Service
public class StatementServiceImpl implements StatementService {

	@Inject
	private StatementDAO dao;
	
	@Override
	public List<SaleVO> orderByLocation(String u_id) {
		// TODO Auto-generated method stub
		return dao.orderByLocation(u_id);
	}

	@Override
	public List<SaleVO> orderByDay(String u_id) {
		// TODO Auto-generated method stub
		return dao.orderByDay(u_id);
	}

	@Override
	public List<SaleVO> orderByMonth(String u_id) {
		// TODO Auto-generated method stub
		return dao.orderByMonth(u_id);
	}

	@Override
	public List<SaleVO> orderByMenu(String u_id) {
		// TODO Auto-generated method stub
		return dao.orderByMenu(u_id);
	}

}
