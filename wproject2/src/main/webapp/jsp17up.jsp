<%@page import="pack.SangpumDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String code = request.getParameter("code"); %>

<jsp:useBean id="connP" class="pack.ConnPooling" />    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
SangpumDto dto = connP.updateData(code);
if(dto == null) {
%>
	<script type="text/javascript">
		alert("잘못된 상품 코드 입니다.\n 수정 불가");
		// history.back(); : 이전으로 돌아감.
		location.href = "jsp17dbcp.jsp";
	</script>
	<%	
	return;
}
%>

** 상품 수정 **<br>
<form action="jsp17upok.jsp" method="post">
	코드 : <%=dto.getCode() %><br> <!-- 프라이머리키로 수정대상이 아님 -->
	<input type="hidden" name="code" value="<%=dto.getCode() %>">
	품명 : <input type="text" name="sang" value="<%=dto.getSang() %>"><br>
	수량 : <input type="text" name="su" value="<%=dto.getSu() %>"><br> 
	단가 : <input type="text" name="dan" value="<%= dto.getDan() %>"><br> 
	<input type="submit" value="자료 수정">
	<input type="button" value="수정 취소" onclick="javascript:location.href='jsp17dbcp.jsp'">
</form>
</body>
</html>