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

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.food.domain.AnswerVO;
import com.food.services.Answer.AnswerService;

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
		//List<AnswerVO> list = new ArrayList<>();
		Map<String, Object> result = new HashMap<>();

		logger.info("Single GET +++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//		page = (page == null ? 1 : page);
//		int curPage = page - 1;

		result.put("list", service.readanswer(qno));
		System.out.	println(result);

		return result;

	}

	@CrossOrigin // 크로스 오리진
	@ResponseBody
	@RequestMapping(value = "/registeranswer", method = RequestMethod.POST)
	public void registerPost(RedirectAttributes rttr, AnswerVO voa) throws Exception {

		service.registeranswer(voa);
		service.updateanscnt(voa.getQno());

		logger.info("Resister POST++++++++++++++++++++++++++++++++++++++++++++++++++++");

	}

	@CrossOrigin
	@ResponseBody
	// @Transactional
	@RequestMapping(value = "/deleteanswer", method = RequestMethod.GET)
	public void delete(RedirectAttributes rttr, AnswerVO voa, Integer ano) throws Exception {
	//	AnswerVO voa = new AnswerVO();
		logger.info("Delete GET ++++++++++++++++++++++++++++++++++++++++++++++++++++");
		System.out.println(voa);
		service.deleteanswer(voa);
		System.out.println("dddddddddddddddddddddddddddddd");
		service.updateanscnt(voa.getQno());
		System.out.println(voa.getQno());
		logger.info("나옴 ++++++++++++++++++++++++++++++++++++++++++++++++++++");


	}

	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/updateanswer", method = RequestMethod.GET)
	public void update(Model model, Integer ano) throws Exception {
		model.addAttribute("view", service.viewanswer(ano));
		logger.info("Update GET ++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

	}

	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/updateanswer", method = RequestMethod.POST)
	public void updatePost(AnswerVO voa, RedirectAttributes rttr) throws Exception {
		System.out.println("++++++++++++++++++++++++++++++++++POST");

		logger.info("Update POST ++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

		service.updateanswer(voa);
		logger.info("Update 나가는곳 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++");



	}

}
