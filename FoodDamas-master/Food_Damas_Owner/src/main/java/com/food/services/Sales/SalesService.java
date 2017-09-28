package com.food.services.Sales;


import java.util.HashMap;
import java.util.List;

import com.food.domain.MemberVO;
import com.food.domain.SaleVO;

public interface SalesService {
	
	public void insert(SaleVO vo);
	public List<SaleVO> read(String u_id);
	public SaleVO readSalesOne(String u_id);
	public void update(String u_id);
	public MemberVO readOne(String u_id) throws Exception;
	/*David Quang*/
	public int getLastedInsertByUID(String u_id) throws Exception;
	public void updateSale(HashMap<String,Object> mapObj) throws Exception;
	public int getState(int sno) throws Exception;
	public void closeTruck(int sno) throws Exception;
	//데이터가 없을 때 아무 값이나 넣어주려고 만듦
	
	public void insertFake(String u_id);

	

}
