package kr.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutController implements Controller {
	
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession(false); // 세션이 있으면 읽고 없으면 못읽음
		session.removeAttribute("userid");
		
		ModelAndView modelAndView = new ModelAndView(); // 스프링 방식을 따라하는 중
		modelAndView.setViewName("login.html"); 
		modelAndView.setRedirect(true); // false : forwarding 방식 , true : redirect 방식
		
		return modelAndView;
	}

}
