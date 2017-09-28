package org.food.persistence;

import java.util.List;

import org.food.domain.CartVO;

public interface CartDAO {
	
	public List<CartVO> readCart(String c_id);
	
	public void updateQuantity(CartVO vo);
	
	public void deleteCart(Integer cno);
	
	public void updateCart(String c_id);
	//kwon's insert
	public void insertCart(CartVO vo)throws Exception; 
	//kwon's orderdetail_list mno랑 quantity 가져오기
	public List<CartVO> orderdetaillist(CartVO vo)throws Exception;
	//kwon's order totalprice랑 regdate가져오기
	public CartVO orderlist(Integer ono)throws Exception;
}
