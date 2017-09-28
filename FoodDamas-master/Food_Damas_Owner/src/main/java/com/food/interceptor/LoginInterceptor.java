package com.food.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	private static final String LOGIN="login";
	private static final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,ModelAndView modelAndView)
			throws Exception {
		//memberVO��� �̸����� ��ü�� ��Ƶ� ���� �̻��¸� üũ�Ͽ� httpsession�� ����
			HttpSession session=request.getSession();
			
			ModelMap modelMap=modelAndView.getModelMap();
			Object memberVO=modelMap.get("memberVO");
			
			if(memberVO!=null){
				logger.info("���ο� �α��� ����?");
				session.setAttribute(LOGIN, memberVO);
				logger.info(""+request.getParameter("useCookie"));
				if(request.getParameter("useCookie")!=null){
					logger.info("����ϱ� ���̵�");
					
					Cookie loginCookie=new Cookie("loginCookie", session.getId());
					loginCookie.setPath("/");
					loginCookie.setMaxAge(60*60*24*7);//��Ű�ð�
					response.addCookie(loginCookie);
				}
				//response.sendRedirect("/home");
			}
			
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
			
		
		// ���� �ڵ��� ���� httpsession�� �����ִ� ������ �ִ°�쿡 ����
		HttpSession session =request.getSession();
		
		if(session.getAttribute(LOGIN)!=null){
			logger.info("�����ѵ�ƾƾƾƾƾ�");
			session.removeAttribute(LOGIN);
			
		}
		
		
		return true;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
