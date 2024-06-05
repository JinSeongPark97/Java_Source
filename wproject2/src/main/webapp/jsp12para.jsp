<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
 	String msg = request.getParameter("msg") ; 
    %>
<jsp:useBean id="my" class="pack.para1Class"></jsp:useBean>  <!-- 객체 생성 완료 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<b>Beans 연습 : 빈즈에 값 전달</b>
<%
// 우리가 현재까지 알고 있는 기술 사용
my.setMsg(msg);
out.println("<br>메세지 출력 : " + my.getMsg());
%>
<br>
<!-- JSP에서는 아래의 방법을 매우 권장! -->
<!-- String msg = request.getParameter("msg"); 내부적으로 자동 처리 -->
<jsp:setProperty property="msg" name="my"/> <!-- Setter 호출 시 사용 -->
<br>메세지 출력(action tag 사용) : 
<jsp:getProperty property="msg" name="my"/> <!-- getter 호출시 사용 -->
</body>
</html>