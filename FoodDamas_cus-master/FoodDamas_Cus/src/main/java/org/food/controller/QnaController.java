package org.food.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.food.domain.AnswerVO;
import org.food.domain.QnaVO;
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
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Inject
	private QnaService service;

	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "/qna/{u_id}/{c_id}", method = RequestMethod.GET)
	public Map<String, Object> mainIndex(@PathVariable String u_id,@PathVariable String c_id,Integer page) {
		List<QnaVO> list = new ArrayList<>();
		Map<String, Object> result = new HashMap<>();
		
		int totalCount = service.pageCount(u_id);
		QnaVO vo = new QnaVO();

		logger.info("Single JSON ++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		page = (page == null ? 1 : page);
		int curPage = page - 1;

		result.put("totalCount", service.pageCount(u_id));
		result.put("pageMaker", new PageMaker(page, totalCount));
		
		vo.setU_id(u_id);
		vo.setC_id(c_id);
		vo.setQno(curPage * 10);
		result.put("list", service.read(vo));

		return result;

	}
	
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public void list(Model model, Integer page, QnaVO vo) throws Exception {
		logger.info("AJAX Get +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");

	}

	@CrossOrigin // 크로스 오리진
	@ResponseBody
	@RequestMapping(value = "/registerqna", method = RequestMethod.POST)
	public void registerPost( QnaVO vo) throws Exception {

		service.registerqna(vo);
		service.updateanscnt(vo.getQno());

		logger.info("Resister POST++++++++++++++++++++++++++++++++++++++++++++++++++++");

	}
	
	@CrossOrigin
	@ResponseBody
	// @Transactional
	@RequestMapping(value = "/deleteqna", method = RequestMethod.GET)
	public void delete(QnaVO vo, Integer qno) throws Exception {
	//	AnswerVO voa = new AnswerVO();
	
		service.deleteqna(vo);
		service.updateanscnt(vo.getQno());


	}
	
	
	
}