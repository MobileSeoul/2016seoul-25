package org.food.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.food.domain.InfoVO;
import org.food.domain.QnaVO;
import org.food.domain.ReviewVO;
import org.food.domain.SalesVO;
import org.food.service.InfoService;
import org.food.service.PageMaker;
import org.food.service.ReviewService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/")
public class InfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);


		@Inject
		private InfoService service;

		@CrossOrigin
		@ResponseBody
		@RequestMapping(value = "/info/{u_id}", method = RequestMethod.GET)
		public Map<String, Object> mainIndex(@PathVariable String u_id) throws Exception  {
			List<ReviewVO> list = new ArrayList<>();
			Map<String, Object> result = new HashMap<>();
			
			InfoVO vo = new InfoVO();
			SalesVO so = new SalesVO();
			
			

			logger.info("Single JSON ++++++++++++++++++++++++++++++++++++++++++++++++++++++");
	
			
			vo.setU_id(u_id);
			result.put("list", service.readlist(u_id));
			result.put("map", service.map(u_id));
			
			System.out.println(result);

			return result;

		}


		
		@RequestMapping(value = "/info", method = RequestMethod.GET)
		public void list(Model model, Integer page) throws Exception {
			logger.info("AJAX Get +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

		}
		
		
		
		
		
		

}
