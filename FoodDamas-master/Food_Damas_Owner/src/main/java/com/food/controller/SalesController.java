package com.food.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.services.Sales.SalesService;
import com.food.services.Statement.StatementService;

@Controller
@RequestMapping("/")
public class SalesController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@Inject
	private StatementService service;
	
	@Inject
	private SalesService saleService;

	@RequestMapping(value = "/sales", method = RequestMethod.GET)
	public void home(Model model) {
		logger.info("sales  connected...........");
		service.orderByDay("zzennam");
	}

	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/sales/{u_id}", method = RequestMethod.GET)
	public Map<String, Object> listGET(@PathVariable String u_id) throws Exception {
		// rest방식으로
		System.out.println("아이디는: " + u_id);
		Map<String, Object> result = new HashMap<>();
		result.put("location", service.orderByLocation(u_id));
		result.put("daily", service.orderByDay(u_id));
		result.put("monthly", service.orderByMonth(u_id));
		result.put("menu", service.orderByMenu(u_id));
		return result;
	}
	
	/*David Quang*/
	@RequestMapping(value="/updateLocation",method=RequestMethod.POST)
	public ResponseEntity<String> setCurrentPosition(
			@RequestParam("uid") String uid,
			@RequestParam("lat") double lat,
			@RequestParam("lng") double lng,
			@RequestParam("address") String address) throws Exception{
		ResponseEntity<String> entity = null;
		int sno = saleService.getLastedInsertByUID(uid);
		//System.out.println(sno);
		HashMap<String,Object> mapObj = new HashMap<String,Object>();
		mapObj.put("sno", sno);
		mapObj.put("lat", lat);
		mapObj.put("lng", lng);
		mapObj.put("address", address); 
		try{
			saleService.updateSale(mapObj);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception ex){
			ex.printStackTrace();
			entity = new ResponseEntity<String>(ex.getMessage(),HttpStatus.BAD_REQUEST);
		}		
		return entity;
	}
	@RequestMapping(value="/closeTruck",method=RequestMethod.GET)
	public ResponseEntity<String> closeTruck(@RequestParam("uid") String id) throws Exception{
		
		ResponseEntity<String> entity = null;
		int sno = saleService.getLastedInsertByUID(id);
		try{
			saleService.closeTruck(sno);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception ex){
			ex.printStackTrace();
			entity = new ResponseEntity<String>(ex.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/getState",method= RequestMethod.GET)
	public ResponseEntity<String> getState(@RequestParam("uid") String id) throws Exception{
		logger.info(id);
		ResponseEntity<String> entity = null;
		int sno  = saleService.getLastedInsertByUID(id);
		try{
			int state = saleService.getState(sno);
			String value ="";
			if(state ==1){
				value="Checked";
			}
			entity = new ResponseEntity<String>(value,HttpStatus.OK);
		}catch(Exception ex){
			ex.printStackTrace();
			entity = new ResponseEntity<String>(ex.getMessage(),HttpStatus.BAD_REQUEST);
		}
	
		return entity;
	}
}
