package org.food.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.food.domain.AnswerVO;
import org.food.domain.QnaVO;
import org.food.service.AnswerService;
import org.food.service.PageMaker;
import org.food.service.QnaService;
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
public class AnswerController {
	private static final Logger logger = LoggerFactory.getLogger(AnswerController.class);

	@Inject
	private AnswerService service;

	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/answer/{qno}", method = RequestMethod.GET)
	public Map<String, Object> mainAnswer(@PathVariable Integer qno, Integer page) throws Exception {
		List<AnswerVO> list = new ArrayList<>();
		Map<String, Object> result = new HashMap<>();

		logger.info("Single GET +++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//		page = (page == null ? 1 : page);
//		int curPage = page - 1;

		result.put("list", service.readlist(qno));
		System.out.	println(result);

		return result;

	}

	
	
}