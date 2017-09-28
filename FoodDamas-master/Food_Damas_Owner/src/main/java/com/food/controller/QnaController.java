package com.food.controller;


import java.util.HashMap;
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


import com.food.domain.QnAVO;
import com.food.services.PageMaker.PageMaker;
import com.food.services.QnA.QnaService;

@Controller
@RequestMapping("/")
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Inject
	private QnaService service;

	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/list/{u_id}", method = RequestMethod.GET)
	public Map<String, Object> mainIndex(@PathVariable String u_id,Integer page) throws Exception {		
		Map<String, Object> result = new HashMap<>();
		
		int totalCount = service.pageCount(u_id);
		QnAVO vo = new QnAVO();

		//logger.info("Single JSON ++++++++++++++++++++++++++++++++++++++++++++++++++++++"+page);
		page = (page == null ? 1 : page);
		int curPage = page - 1;

		result.put("totalCount", service.pageCount(u_id));
		result.put("pageMaker", new PageMaker(page, totalCount));		
		
		
		vo.setU_id(u_id);
		vo.setQno(curPage * 10);
		result.put("list", service.readlist(u_id));
		//System.out.println(service.read(vo));
		result.put("list", service.read(vo));

		return result;

	}

	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public void list(Model model, Integer page, QnAVO vo) throws Exception {
		//logger.info("AJAX Get +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

		int total = service.pageCount(vo.getU_id());

		page = (page == null ? 1 : page);
		int curPage = page - 1;

		model.addAttribute("page", new PageMaker(page, total));
		model.addAttribute("list", service.readview(curPage * 10));

		model.addAttribute("pageNum", page);

	}

}
