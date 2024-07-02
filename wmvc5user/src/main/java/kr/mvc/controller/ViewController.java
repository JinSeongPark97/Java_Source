package kr.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.mvc.model.UserDto;
import kr.mvc.model.UserManager;

public class ViewController implements Controller { 
	
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 상세 보기 처리
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid"); // id를 받음
		
		// 모델과 통신
		UserDto dto = UserManager.instance().findUser(userid);
		request.setAttribute("user", dto);
		
		ModelAndView modelAndView = new ModelAndView(); // 스프링 방식을 따라하는 중
		modelAndView.setViewName("view.jsp"); // 하나의 데이터 상세보기 출력용 페이지
		
		modelAndView.setRedirect(false); // false : forwarding 방식 , true : redirect 방식
		return modelAndView;
	}

}
