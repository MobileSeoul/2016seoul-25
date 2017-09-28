package org.food.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.food.domain.CartVO;
import org.springframework.stereotype.Repository;


@Repository
public class CartDAOImpl implements CartDAO {
	
	@Inject
	private SqlSession session;
	
	
	private static String namespace ="org.food.mapper.CartMapper";	


	@Override
	public List<CartVO> readCart(String c_id) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".readCart",c_id);

	}


	@Override
	public void updateQuantity(CartVO vo) {
		// TODO Auto-generated method stub
		session.update(namespace+".updateQuantity",vo);
	}


	@Override
	public void deleteCart(Integer cno) {

		session.delete(namespace+".deleteCart", cno);
	}


	@Override
	public void updateCart(String c_id) {
		session.update(namespace+".updateCart",c_id);	
	}
	
	//kwon's insert
	@Override
	public void insertCart(CartVO vo) throws Exception {
		session.insert(namespace+".insertCart", vo);
		
	}

	//kwon's orderdetail_list mno랑 quantity 가져오기
	@Override
	public List<CartVO> orderdetaillist(CartVO vo) throws Exception {
		return session.selectList(namespace+".", vo);
		
	}

	//kwon's order totalprice랑 regdate가져오기(ono, c_id)
	@Override
	public CartVO orderlist(Integer ono) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
