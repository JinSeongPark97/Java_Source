<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardMgr" class="pack.board.BoardMgr" />

<%
String spage = request.getParameter("page");
String num = request.getParameter("num");
String pass = request.getParameter("pass");

// 비밀번호 비교를 위한 메소드
boolean b = boardMgr.checkPass(Integer.parseInt(num),pass); // 비밀번호 비교. 

if(b){
	boardMgr.delData(num); 
	response.sendRedirect("boardlist.jsp?page=" + spage);
}else{
%>
	<script>
	alert("비밀번호 불일치");
	history.back();
	</script>
<% 
}
%>