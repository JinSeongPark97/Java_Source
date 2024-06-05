<%@page import="java.util.Base64"%>
<%@page import="io.jsonwebtoken.Jwts"%>
<%@page import="io.jsonwebtoken.Claims"%>
<%@page import="io.jsonwebtoken.Jws"%>
<%@page import="io.jsonwebtoken.security.Keys"%>
<%@page import="java.security.Key"%>
<%@page import="io.jsonwebtoken.JwtException"%>
<%@page import="javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 쿠키에서 jwt를 가져와 유효성 검사
Cookie[] cookies = request.getCookies();
String jwt = null;
if(cookies != null){
	for(Cookie cookie:cookies){
		if(cookie.getName().equals("jwt")){
			jwt = cookie.getValue();
			break;
		}
	}
}
if(jwt != null){
	try{
		// 고정된 비밀 키 사용 (예제용)
		// String secretKeyString = "mySuperSecretKey12345678901234567890123456789012"; // refresh 키
		// Key secretKey = Keys.hmacShaKeyFor(secretKeyString.getBytes());
		
		String encodedKey = (String) getServletContext().getAttribute("secretKey");
 	   	byte[] decodedKey = Base64.getDecoder().decode(encodedKey);
    	Key secretKey = Keys.hmacShaKeyFor(decodedKey);
    	HttpSession ses = request.getSession(false);
    	
		
		// JWT 유효성 검사 (이미 발급된 JWT를 검증하고 그 내용을 파악) 
		Jws<Claims> claims = Jwts.parserBuilder()
							.setSigningKey(secretKey) // 서명키 설정. jwt 생성시 사용된 secretkey와 일치해야함
							.build() // 파서 객체 생성
							.parseClaimsJws(jwt);
		String userid = claims.getBody().getSubject(); // subject 클레임을 반환.
		// claims.getBody() : JWT의 payload를 반환
		// 유효한 경우 환영 메세지 출력

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 style="font-size : 30px">JWT 로그인 성공 페이지</h2>
<p>환영합니다. <%= userid %>님</p>
<hr>인증에 성공한 경우 처리할 뭔가를 작업<br>
Authorization(인가)<br>
쇼핑, 게시판, 방명록, 회의 참여...
<hr>
<a href="jsp10logout.jsp">로그아웃</a>
</body>
</html>
<%
	}catch(JwtException e){
		// jwt가 유효하지 않으면 로그인 페이지로 이동
		response.sendRedirect("jsp10jwtlogin.html");
}
	
}else{
	// JWT 없으면 로그인 페이지로 이동
	response.sendRedirect("jsp10jwtlogin.html");
	
}
%>