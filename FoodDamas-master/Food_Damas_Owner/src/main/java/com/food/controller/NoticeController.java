package com.food.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.food.domain.NoticeVO;
import com.food.services.Notice.NoticeService;
import com.food.services.PageMaker.PageMaker;




@Controller
@RequestMapping("/")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Inject
	private NoticeService service;

	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/notice", method = RequestMethod.GET)
	public Map<String, Object> mainAnswer( Integer page) throws Exception {
		System.out.println(page);

		List<NoticeVO> list = new ArrayList<>();
		Map<String, Object> result = new HashMap<>();

		
		int totalCount = service.pageCountnotice();

		logger.info("Single GET +++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		System.out.println();
		page = (page == null ? 1 : page);
		int curPage = page - 1;
		
		NoticeVO vo = new NoticeVO();

		

		result.put("totalCount1", service.pageCountnotice());
		result.put("pageMaker1", new PageMaker(page, totalCount));
		
		
		vo.setNno(curPage * 10);

		result.put("list1", service.readnotice(vo));
		System.out.	println(result);
		return result;

	}
	
	
	
	
	
}
