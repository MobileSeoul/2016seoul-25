package org.food.controller;

import java.util.List;

import javax.inject.Inject;

import org.food.domain.OrderVO;
import org.food.service.CartService;
import org.food.service.OrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;

import com.fasterxml.jackson.annotation.JacksonInject;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Inject
	OrderService service;

	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@RequestMapping(value="/orderlist")
	public void orderListGET(){
		logger.info("mypage orderList......");
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/insertOrder", method = RequestMethod.POST)
	public String insertOrderPOST(@RequestBody OrderVO vo ) {
		String result;
		
		logger.info(""+vo);
		if(vo.getTotal_price()==0){
			result="fail";
		}else{
			System.out.println("오더포스트");
			logger.info(""+vo);
			service.insertOrder(vo);
			result="success";
		}
		return "result";
		
	}

}
