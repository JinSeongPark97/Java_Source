package kr.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.mvc.model.UserManager;

public class LoginController implements Controller {
	
	
	// 추상메소드 오버라이드
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("userid");
		String pwd = request.getParameter("password");
		
		// 모델과 통신
		UserManager manager = UserManager.instance();
		boolean b = manager.login(id, pwd);
		
		ModelAndView modelAndView = new ModelAndView();
		if(b) {
			// 로그인 성공 자격을 갖춤
			HttpSession session = request.getSession(true); // 없으면 만들고 있으면 읽음
			session.setAttribute("userid", id);
			modelAndView.setViewName("list.m2"); // 확장자가 m2여야 servlet을 만남 -> 목록 보기 위해
			// redirect 방식으로 요청해야 함
		}else {
			modelAndView.setViewName("fail.html");
		}
		modelAndView.setRedirect(true);
		return modelAndView;
	}
}
