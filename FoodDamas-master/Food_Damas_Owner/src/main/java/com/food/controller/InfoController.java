package com.food.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.food.domain.SaleVO;
import com.food.services.Sales.SalesService;



@Controller
@RequestMapping("/")
public class InfoController {
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	
	@Inject
	private SalesService service;

	@RequestMapping(value="/info", method = RequestMethod.GET)
	public void list(Model model,String u_id) throws Exception{
		logger.info("info 들어왔다!!!!!!!!!!!!!!!!!!!!!!!!!!");
		System.out.println(u_id);
		model.addAttribute("info", service.readOne("food1"));//���
		model.addAttribute("list", service.readSalesOne("food1"));//sales
		System.out.println(service.readOne("food1"));
		System.out.println("==================");
		System.out.println(service.readSalesOne("food1"));
		
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value="/listInfo/{u_id}", method = RequestMethod.GET)
	public Map<String, Object> listGET(@PathVariable String u_id) throws Exception{
		logger.info("Info List");
		List<SaleVO> vo=service.read(u_id);
		System.out.println(vo);
		if(vo.isEmpty()){//db에 오늘 날짜가 없을때 실행될 쿼리문
			
			logger.info("111111111111111111111111111111111111111");
			service.insertFake(u_id);
		}
		
		Map<String, Object> result=new HashMap<>();
		result.put("list", service.read(u_id));
		result.put("info",service.readOne(u_id));
		
		return result;
		
	}

	
	

}
