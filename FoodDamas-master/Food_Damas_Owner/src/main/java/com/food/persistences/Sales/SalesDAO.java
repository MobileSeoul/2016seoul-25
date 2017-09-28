package com.food.persistences.Sales;


import java.util.HashMap;
import java.util.List;

import com.food.domain.SaleVO;

public interface SalesDAO {
	
	public void insert(SaleVO vo);
	public List<SaleVO> read(String u_id);
	public void update(String u_id);
	public SaleVO readSalesOne(String u_id);
	public void insertFake(String u_id);
	/*David Quang*/
	public int getLastedInsertByUID(String u_id) throws Exception;
	public void updateSale(HashMap<String,Object> mapObj) throws Exception;
	public void closeTruck(int sno) throws Exception;
	public int getState(int sno) throws Exception;
	

}
