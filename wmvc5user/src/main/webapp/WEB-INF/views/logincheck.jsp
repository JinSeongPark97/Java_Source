<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session = request.getSession(false); // 세션이 있으면 읽고 없으면 만들기 x

if(session == null || session.getAttribute("userid") == null) {
	//response.sendRedirect("login.jsp");
	
	out.println("<script>");
	out.println("alert('로그인 후 목록보기 가능')");
	out.println("location.href='login.html'");
	out.println("</script>");
	
	return;
	
}
%>