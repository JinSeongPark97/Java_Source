<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

if(id.equals("admin") && pwd.equals("111")){ // equls -> (문자열 비교)하여 세션을 생성하여 로그인 / 비밀번호가 틀리면 로그인 실패.
	// 로그인에 성공했으므로 세션을 생성.
	session.setAttribute("adminOk", id);
	out.println("로그인 성공<br>");
}else{
	out.println("로그인 실패<br>");
}
%>

<a href="javascript:window.close()">[창닫기]</a>
</body>
</html>