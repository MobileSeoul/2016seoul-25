package com.food.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

import com.food.domain.OrderStateVO;
import com.food.domain.OrderVO;
import com.food.services.Order.OrderService;
import com.food.services.Order.OrderStateService;
import com.food.services.Sales.SalesService;


@Controller
@RequestMapping("/order")
public class OrderController {
	private static final Logger logger 
	= LoggerFactory.getLogger(OrderController.class);
	
	@Inject
	private OrderService service;
	
	@Inject
	private OrderStateService stateService;
	
	@Inject
	private SalesService saleService;
	
	@RequestMapping(value="",method=RequestMethod.GET)
	public String Order (){
		logger.info("Get to show Order Page");
		return "order";
	}
	
	@RequestMapping(value="/updateState",method=RequestMethod.POST)
	public ResponseEntity<String> updateState(@RequestParam("oid") int id,@RequestParam("ostate") String state) throws Exception{
		ResponseEntity<String> entity =null;

		if(state.equals("finish")){
			state = "cook finish";
		}
		if(state.equals("pickup")){
			state ="pick up";
			
		}
		HashMap<String,Object> map = new HashMap<String,Object>();
		int state_code =0;
		List<OrderStateVO> list = stateService.listOrderState();
		for(int i=0;i<list.size();i++){
			if(list.get(i).getState_name().toUpperCase().equals(state.toUpperCase())){
				state_code =list.get(i).getState_code();			
			}
		}
		map.put("state_code", state_code);
		map.put("ono", id);
		service.updateOrderState(map);
		entity = new ResponseEntity<>("SUCCESS",HttpStatus.OK);
		return entity;
	}
	
	
	@RequestMapping(value="/listOrderBySaleID",method=RequestMethod.GET)
	public ResponseEntity<List<OrderVO>> getListOrderBySaleID(@RequestParam("uid") String u_id) throws Exception{
		logger.info("Retrieve JSON Of Order By Sal ID...................");
		System.out.println(u_id);
		System.out.println(saleService.getLastedInsertByUID(u_id));
		int saleID = saleService.getLastedInsertByUID(u_id);
		logger.info(""+saleID);
		ResponseEntity<List<OrderVO>> entity =null;
		try{
			List<OrderVO> list = service.getListOrderBySaleID(saleID);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		}catch(Exception e)
		{
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value="/listOrderFinished",method=RequestMethod.GET)
	public ResponseEntity<List<OrderVO>> getListOrderFinished(@RequestParam("uid") String u_id) throws Exception{
		System.out.println(u_id);
		int saleID = saleService.getLastedInsertByUID(u_id);
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("sale_id", saleID);
		map.put("state", 16);
		System.out.println(map);
		ResponseEntity<List<OrderVO>> entity =null;
		try{
			List<OrderVO> list = service.getFinishedOrder(map);
			entity = new ResponseEntity<>(list,HttpStatus.OK);
		}catch(Exception ex){
			ex.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
