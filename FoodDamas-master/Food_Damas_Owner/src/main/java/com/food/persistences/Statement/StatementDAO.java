package com.food.persistences.Statement;



import com.food.domain.SaleVO;

import java.util.List;

public interface StatementDAO {
	
	public List<SaleVO> orderByLocation(String u_id);

	public List<SaleVO> orderByDay(String u_id);

	public List<SaleVO> orderByMonth(String u_id);

	public List<SaleVO> orderByMenu(String u_id);


}
