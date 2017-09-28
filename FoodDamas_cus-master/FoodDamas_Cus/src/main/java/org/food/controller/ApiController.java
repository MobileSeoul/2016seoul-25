package org.food.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.food.domain.ApiVO;
import org.food.service.ApiService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/")
public class ApiController {
	private static final Logger logger = LoggerFactory.getLogger(ApiController.class);

	
	
	
	@Inject
	private ApiService service;

	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/apilist/{lat}/{lng}", method = RequestMethod.GET)
	public Map<String, Object> mainIndex(@PathVariable Double lat,@PathVariable Double lng) throws Exception  {
		List<ApiVO> list = new ArrayList<>();
		Map<String, Object> result = new HashMap<>();
	
		
		ApiVO vo = new ApiVO();

		logger.info("Single JSON ++++++++++++++++++++++++++++++++++++++++++++++++++++++");

		
		
		vo.setLat(127.02928809999999);
		vo.setLng(37.4923615);
		
		result.put("list", service.readlist(vo));
		
		System.out.println(result);

		return result;

	}


	@RequestMapping(value = "/api", method = RequestMethod.GET)
	public void list(Model model, Integer page) throws Exception {
		logger.info("AJAX Get +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

	}

	@RequestMapping(value = "/api1", method = RequestMethod.GET)
	public void list1(Model model, Integer page) throws Exception {
		logger.info("AJAX Get +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

	}

	@RequestMapping(value = "/api2", method = RequestMethod.GET)
	public void list2(Model model, Integer page) throws Exception {
		logger.info("AJAX Get +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

	}

	
	@RequestMapping(value = "/api3", method = RequestMethod.GET)
	public void list3(Model model, Integer page) throws Exception {
		logger.info("AJAX Get +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		
	}
	
	
	@RequestMapping(value = "/api4", method = RequestMethod.GET)
	public void list4(Model model, Integer page) throws Exception {
		logger.info("AJAX Get +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		
	}
	
	
	
}