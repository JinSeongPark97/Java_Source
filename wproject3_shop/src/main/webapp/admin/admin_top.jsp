<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String adminId = (String)session.getAttribute("adminOk"); // 세션 체크

if(adminId == null){ 
	response.sendRedirect("adminlogin.jsp"); // 로그인화면으로 이동
	//return; : return 생략이 가능하다.
}
%>
<table>
	<tr style="background : linear-gradient(to right, gold, red, yellow); text-align: center;" height="25px">
		<td><a href="..//guest/guest_index.jsp">홈페이지</a></td>
		<td><a href="adminlogout.jsp">로그아웃</a></td>
		<td><a href="membermanager.jsp">회원관리</a></td>
		<td><a href="productmanager.jsp">상품관리</a></td>
		<td><a href="ordermanager.jsp">주문관리</a></td>
	</tr>
</table>