package kr.mvc.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception; // 추상메소드 (파라미터2개)
	
}
