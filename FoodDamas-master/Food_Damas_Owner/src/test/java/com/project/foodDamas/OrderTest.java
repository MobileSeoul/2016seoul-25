package com.project.foodDamas;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import java.util.*;

import com.food.domain.OrderVO;
import com.food.services.Order.OrderService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
      locations ={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class OrderTest {
	
	@Inject
	private OrderService service;
	
	@Test
	public void getListOrderByCustID() throws Exception{
		ResponseEntity<List<OrderVO>> entity =null;
		try{
			List<OrderVO> list = service.getListOrderByCustID("kwon");
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		}catch(Exception e)
		{
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		System.out.println(entity);
	}
}
