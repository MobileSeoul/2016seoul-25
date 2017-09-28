package org.food.controller;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.food.domain.CartVO;
import org.food.domain.OrderDetailVO;
import org.food.domain.OrderVO;
import org.food.persistence.CartDAO;
import org.food.persistence.OrderDAO;
import org.food.persistence.OrderDetailDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class OrderTest {
	
	@Inject
	OrderDAO dao;
	
	@Inject
	OrderDetailDAO ddao;
	
	@Test
	public void orderDetail(){
		OrderDetailVO vo=new OrderDetailVO();
		vo.setOno(61);
		
		System.out.println(ddao.readDetail(61));
	}
	
	@Test
	public void test() {
		OrderVO vo=new OrderVO();
		vo.setTotal_price(1000);
		vo.setSno(50);
		vo.setC_msg("맛있게해주세요");
		vo.setC_id("1");
		dao.insertOrder(vo);
	}

}
