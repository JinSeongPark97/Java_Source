<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="pack.business.ProcessDao" />

<%
String code = request.getParameter("code");

boolean b = processDao.delData(Integer.parseInt(code)); // int형이기 때문에 ingeger.parseint 사용

if(b){	
	response.sendRedirect("list.jsp");
}else{
%>
	<script>
	alert("삭제 실패")
	location.href="list.jsp";
	</script>
<%
}
%>