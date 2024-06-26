<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
<jsp:useBean id="form" class="pack.business.DataForm" />
<jsp:setProperty property="*" name="form"/>
<jsp:useBean id="processDao" class="pack.business.ProcessDao" />

<%
processDao.insData(form);
response.sendRedirect("list.jsp"); // 클라이언트의 주소가 변경 됨
%>