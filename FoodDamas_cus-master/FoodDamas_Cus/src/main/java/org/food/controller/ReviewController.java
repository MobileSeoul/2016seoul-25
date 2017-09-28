package org.food.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.food.domain.QnaVO;
import org.food.domain.ReviewVO;
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
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);


		@Inject
		private ReviewService service;

		@CrossOrigin
		@ResponseBody
		@RequestMapping(value = "/review/{u_id}", method = RequestMethod.GET)
		public Map<String, Object> mainIndex(@PathVariable String u_id,Integer page)  {
			List<ReviewVO> list = new ArrayList<>();
			Map<String, Object> result = new HashMap<>();
			
			int totalCount = service.pageCount(u_id);
			ReviewVO vo = new ReviewVO();

			logger.info("Single JSON ++++++++++++++++++++++++++++++++++++++++++++++++++++++");
			page = (page == null ? 1 : page);
			int curPage = page - 1;
			
			System.out.println(totalCount);

			result.put("totalCount", service.pageCount(u_id));
			result.put("pageMaker", new PageMaker(page, totalCount));
			
			vo.setU_id(u_id);
			vo.setRno(curPage * 10);
			result.put("list", service.readlist(vo));

			return result;

		}
		
		
		@RequestMapping(value = "/review", method = RequestMethod.GET)
		public void list(Model model, Integer page,ReviewVO vo) throws Exception {
			
		}
		
		@CrossOrigin // 크로스 오리진
		@ResponseBody
		@RequestMapping(value = "/registerreview", method = RequestMethod.POST)
		public void registerPost( ReviewVO vo) throws Exception {
			

			System.out.println(vo);
			service.registerreview(vo);

			logger.info("Resister POST++++++++++++++++++++++++++++++++++++++++++++++++++++");

		}
		
		
		

}
