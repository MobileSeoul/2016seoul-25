package com.food.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.food.domain.MemberVO;
import com.food.services.Member.MemberService;

public class AuthInterceptor implements HandlerInterceptor {

	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Inject
	private MemberService service;
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session =request.getSession();
		//�α����� �������� üũ�ϰ� ��Ʈ�ѷ��� ȣ���ϰ� �Ұ����� ���� 
		if(session.getAttribute("login")==null){
			System.out.println("����¿���?");
			Cookie loginCookie=WebUtils.getCookie(request, "loginCookie");
			System.out.println(loginCookie);
			if(loginCookie!=null){
				
				MemberVO memberVO=service.checkLoginBefore(loginCookie.getValue());
				
				logger.info("memberVO:::::::::::::"+memberVO);
				if(memberVO!=null){
					session.setAttribute("login", memberVO);
					return true;
				}
			}
			
			response.sendRedirect("/login");
			
			return false;
		}


		return true;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
