package kr.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateController implements Controller {
	
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		UserForm userForm = new UserForm();
		
		
		
		
		ModelAndView modelAndView = new ModelAndView(); 
		modelAndView.setViewName("update.jsp"); 
		modelAndView.setRedirect(false); 
		
		return modelAndView;
	}

}
