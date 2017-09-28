package org.food.controller;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.food.domain.CartVO;
import org.food.persistence.CartDAO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class cartTest {
	
	@Inject
	CartDAO dao;
	
	@Test
	public void test() {
		CartVO vo=new CartVO();
		vo.setCno(6);
		vo.setQuantity(3);
		dao.updateQuantity(vo);
		
	}

}
