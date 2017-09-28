package com.food.services.Sales;

import java.util.HashMap;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.food.domain.MemberVO;
import com.food.domain.SaleVO;
import com.food.persistences.Member.MemberDAO;
import com.food.persistences.Sales.SalesDAO;

@Service
public class SalesServiceImpl implements SalesService {

	@Inject
	private SalesDAO salesDao;
	
	@Inject 
	private MemberDAO memberDao;

	@Override
	public MemberVO readOne(String u_id) throws Exception {
		
		return memberDao.view(u_id);
	}

	@Override
	public void insert(SaleVO vo) {
		// TODO Auto-generated method stub
		salesDao.insert(vo);
	}

	@Override
	public List<SaleVO> read(String u_id) {
		// TODO Auto-generated method stub
		return salesDao.read(u_id);
	}

	@Override
	public void update(String u_id) {
		// TODO Auto-generated method stub
		salesDao.update(u_id);
	}

	@Override
	public SaleVO readSalesOne(String u_id) {
		// TODO Auto-generated method stub
		return salesDao.readSalesOne(u_id);	
	}

	@Override
	public void insertFake(String u_id) {
		salesDao.insertFake(u_id);		
	}

	@Override
	public int getLastedInsertByUID(String u_id) throws Exception {
		// TODO Auto-generated method stub
		return salesDao.getLastedInsertByUID(u_id);
	}

	@Override
	public void updateSale(HashMap<String, Object> mapObj) throws Exception {
		// TODO Auto-generated method stub
		salesDao.updateSale(mapObj);
	}

	@Override
	public int getState(int sno) throws Exception {
		// TODO Auto-generated method stub
		return salesDao.getState(sno);
	}

	@Override
	public void closeTruck(int sno) throws Exception {
		// TODO Auto-generated method stub
		salesDao.closeTruck(sno);
	}

}
