package kr.mvc.controller;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.mvc.model.UserManager;

public class InsertController implements Controller	{
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		// FormBean 사용
		UserForm userForm = new UserForm();
		userForm.setUserid(request.getParameter("userid"));
		userForm.setPassword(request.getParameter("password"));
		userForm.setName(request.getParameter("name"));
		userForm.setEmail(request.getParameter("email"));
		
		// 모델과 통신 - Controller에서 Model로 이동
		int result = UserManager.instance().insert(userForm);
		
		
		ModelAndView modelAndView = new ModelAndView();
		if(result > 0) {
			// insert 후 목록보기
			modelAndView.setViewName("list.m2"); // 성공 시
		}else {
			modelAndView.setViewName("fail.html");  // 실패 시
		}
		
		modelAndView.setRedirect(true); // 클라이언트를 통해 호출해야하므로 redirect
		
		return modelAndView;
	}

}
