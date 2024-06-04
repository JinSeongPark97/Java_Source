<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
String id = request.getParameter("id");

request.setAttribute("idkey", id); 	 	// 현재 jsp 파일에서만 유효함(private)
application.setAttribute("idkey", id);  // 현재 서비스 중 모두에게 유효함(public)



// servlet인 경우 HttpSession session = request.getSession(true);
// session.setAttribute("idkey", id);
session.setAttribute("idkey", id);		// 세션을 참조하는 파일에서만 유효함
session.setMaxInactiveInterval(10); // session의 유효 시간 설명 10초
// 서버가 클라이언트 컴에 sessionid를 쿠키에 저장해둠.
// 다음부터는 클라이언트가 서버에 정보 요청 시 sessionid가 담긴 쿠키를 들고 간다.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>* 세션 연습 *</h2>
<form action="jsp7session2.jsp">
영화 선택 : <br>
<input type="radio" name="movie" value="범죄도시4" checked="checked">범죄도시4&nbsp;&nbsp;
<input type="radio" name="movie" value="원더랜드" checked="checked">원더랜드&nbsp;&nbsp;
<input type="radio" name="movie" value="퓨리오사" checked="checked">퓨리오사
<input type="submit" value="결과보기">
</form>
</body>
</html>