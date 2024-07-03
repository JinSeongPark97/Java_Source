package kr.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteController implements Controller {
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		ModelAndView modelAndView = new ModelAndView(); 
		modelAndView.setViewName("delete.jsp"); 
		modelAndView.setRedirect(false); 
		
		return modelAndView;
	}

}
