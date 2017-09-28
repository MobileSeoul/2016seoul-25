package com.food.services.Statement;

import java.util.List;

import com.food.domain.SaleVO;

public interface StatementService {
	public List<SaleVO> orderByLocation(String u_id);

	public List<SaleVO> orderByDay(String u_id);

	public List<SaleVO> orderByMonth(String u_id);

	public List<SaleVO> orderByMenu(String u_id);
}
