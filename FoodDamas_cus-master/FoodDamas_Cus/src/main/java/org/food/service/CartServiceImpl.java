package org.food.service;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.CartVO;
import org.food.persistence.CartDAO;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {

	@Inject
	private CartDAO dao;
	
	
	@Override
	public List<CartVO> readCart(String c_id) {
		// TODO Auto-generated method stub
		return dao.readCart(c_id);
	}
	@Override
	public void updateQuantity(CartVO vo) {
		dao.updateQuantity(vo);
	}
	@Override
	public void deleteCart(Integer cno) {

		dao.deleteCart(cno);
	}
	@Override
	public void updateCart(String c_id) {
		dao.updateCart(c_id);
	}
	//kwon's insert
	@Override
	public void insertCart(CartVO vo) throws Exception {
		dao.insertCart(vo);
	}
	//kwon's orderdetail_list mno랑 quantity 가져오기
	@Override
	public List<CartVO> orderdetaillist(CartVO vo) throws Exception {
		return dao.orderdetaillist(vo);
		
	}
}
