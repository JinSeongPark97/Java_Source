package kr.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.mvc.model.UserDto;
import kr.mvc.model.UserManager;

public class UpdateFormController implements Controller {
	
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 수정 화면 띄우기
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("userid");
		
		UserDto dto = UserManager.instance().findUser(userid);
		request.setAttribute("user", dto);
		
		ModelAndView modelAndView = new ModelAndView(); // 스프링 방식을 따라하는 중
		modelAndView.setViewName("update.jsp"); 
		modelAndView.setRedirect(false); // dto 객체(17행)를 전달해야함으로 forwarding
		
		
		
		return modelAndView;
	}

}
