package com.food.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EmployeeController {
	
	
	@ResponseBody
	@RequestMapping(value="/getUser",method=RequestMethod.GET)
	public String getUser(
			){		
		return "success";
	} 
}
 