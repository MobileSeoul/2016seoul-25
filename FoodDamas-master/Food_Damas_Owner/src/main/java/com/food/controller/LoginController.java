package com.food.controller;

import java.util.Date;


import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.food.domain.MemberVO;
import com.food.dto.LoginDTO;
import com.food.services.Member.MemberService;
import com.food.services.Sales.SalesService;



@Controller
@RequestMapping("/")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	private MemberService service;
	
	@Inject
	private SalesService saleService;

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) throws Exception{
	}
	
	
	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model, RedirectAttributes rttr) throws Exception
	{
		MemberVO vo =service.login(dto);
		if(vo==null){
		      rttr.addFlashAttribute("fail", "fail");
		      return;
		}
		//System.out.println(vo);
		model.addAttribute("memberVO", vo);
		System.out.println(dto.isUseCookie());
		System.out.println(session.getId());
		if(dto.isUseCookie()){
			int amount=60*60*24*7;
			Date sessionLimit =new Date(System.currentTimeMillis()+(1000*amount));
			service.keepLogin(vo.getU_id(), session.getId(), sessionLimit);
		}
		saleService.insertFake(vo.getU_id());
	}


	  @RequestMapping(value = "/logout", method = RequestMethod.GET)
	  public String logout(HttpServletRequest request, 
	      HttpServletResponse response, HttpSession session) throws Exception {

	    Object obj = session.getAttribute("login");

	    if (obj != null) {
	      MemberVO vo = (MemberVO) obj;

	      session.removeAttribute("login");
	      session.invalidate();

	      Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

	      if (loginCookie != null) {
	        loginCookie.setPath("/");
	        loginCookie.setMaxAge(0);
	        response.addCookie(loginCookie);
	        service.keepLogin(vo.getU_id(), session.getId(), new Date());
	      }
	    }
		return "login";
	  }
	/*
	 *    @RequestMapping(value="/register", method = RequestMethod.POST)
   public String registerPost(BoardVO vo, RedirectAttributes rttr) {
      
      logger.info("�۾��� POST�۾��� POST�۾��� POST�۾��� POST�۾��� POST");
      service.insert(vo);
      rttr.addFlashAttribute("result", "register");
      return "redirect:/xboard/list";
      
   }*/
	
	

}
