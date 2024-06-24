<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%-- 보통 prefix 값은 "c"로 설정함 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>JSTL</h2>
<hr>
	<ol>
		<li>JSTL은 JavaServer Pages Standard Tag Library의 약어로, Java 코드를 바로 사용하지 않고 HTML 태그(<>) 형태로 직관적인 코딩을 지원하는 라이브러리입니다.
		<li>Java EE 기반의 웹 애플리케이션 개발 플랫폼을 위한 컴포넌트 모음
		<li>XML 데이터 처리와 조건문, 반복문, 국제화와 지역화와 같은 일을 처리하기 위한 JSP 태그 라이브러리
		<li>자신만의 태그를 추가할 수 있는 기능을 제공합니다.
	</ol>
	
변수, 제어문 사용이 가능. 일반적으로 EL과 함께 사용
<hr>
​<b>변수처리</b><br>
<c:set var="irum" value="이기자" scope="page"></c:set> <%-- scope 값 : page, request, session, application --%>
이름 : <c:out value="${irum}"></c:out>
<br>
<c:set var="ir" scope="session">
공기밥
</c:set>
이름 : <c:out value="${ir}" /> <%-- value 값으로 설정 또는 태그 내부에 설정도 가능 --%>
<br>
<%-- 변수를 지우기 위해 remove 사용 --%>
<c:remove var="irum"/>
이름 : <c:out value="${irum}" />
<br>
<c:remove var="ir" scope="session"/>
이름 : <c:out value="${ir}" />
<br><br>
<c:set var="abc" value="${header['User-Agent']}" scope="page" />
abc 값은 (현재 사용중인 브라우저 정보) <c:out value="${abc}" />
<br>
<c:set var="su1" value="10" />
<c:set var="su2">
20
</c:set>
두 수의 합은 ${su1 + su2}
<hr>
<b>조건 판단문 if </b><br/>
<c:set var="nice" value="star" />

<c:if test="${nice == 'star'}"> <%-- ${nice eq 'star'} --%>
	if 연습 : nice 값은 <c:out value="${nice}" />
</c:if>
<p/>
<b>조건 판단문 choose</b><br/>
<c:choose>
	<c:when test="${nice == 'moon'}">
	달 <c:out value="${nice}"></c:out>
	</c:when>
	<c:when test="${nice == 'star'}">
	별 <c:out value="${nice}"></c:out>
	</c:when>
	<c:otherwise>어떠한 조건도 만족하지 않은 경우</c:otherwise>
</c:choose>
<br>
<c:choose>
	<c:when test="${empty param.myid}"> <%-- 처음 param.myid이 없으므로 실행문 실행 --%>
		<form>
			아이디 : <input type="text" name="myid">
			<input type="submit">
		</form>
	</c:when>
	<c:when test="${param.myid == 'admin'}">
		관리자
	</c:when>
	<c:otherwise>
		환영합니다. 회원 <c:out value="${param.myid}" />님
	</c:otherwise>
</c:choose>
<hr>
<b>반복문 forEach</b><br>
연습1 :
<c:forEach var="i" begin="1" end="10" step="2"> <%-- i가 1~10까지 결과 출력 시작 2씩 늘어남 --%>
 	${i}&nbsp;&nbsp;
</c:forEach>
<br><br>
구구단(3단)<br>
<c:forEach var="i" begin="1" end="9">  <%-- i=1 1~9까지 --%>
 	3 * ${i} = ${3 * i}<br> 
</c:forEach>
<br>
<%
HashMap<String, Object> map = new HashMap<>();
map.put("name", "한국인");
map.put("today", new Date());
%>

<c:set var="m" value="<%=map %>"></c:set>
<c:forEach var="i" items="${m}">
	${i.key} - ${i.value}<br> 
</c:forEach> 
<hr>
<b>배열 생성 후 출력</b><br>
<c:set var="arr" value="<%=new int[]{1,2,3,4,5} %>"></c:set>
<c:forEach var="a" items="${arr}" begin="2" end="4" step="1">
	${a}&nbsp;&nbsp;
</c:forEach>
<hr>
<b>문자열 분할 후 출력</b><br>
<c:forTokens var="animal" items="horse,dog,cat,lion,tiger,pig" delims=",*"> <%-- delims가 여러 개여도 상관X --%>
	동물 : ${animal}&nbsp;
</c:forTokens>
<hr>
<b>숫자 및 날짜 서식</b><br>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
숫자 : <fmt:formatNumber value="12345.678" type="number" /><br> <%-- 3자리마다 , 찍어줌 --%>
숫자 : <fmt:formatNumber value="12345.678" type="number" pattern="#,##0" /><br> <%-- 소수 첫째자리에서 반올림 --%>
숫자 : <fmt:formatNumber value="12345.678" type="currency" /><br> <%-- 통화 : 원 --%>
숫자 : <fmt:formatNumber value="0.123" type="percent" /><br> <%-- 퍼센트 : % --%>
숫자 : <fmt:formatNumber value="12345.678" pattern="#,##0.0" /><br> <%-- 소수 둘째자리에서 반올림 --%>
숫자 : <fmt:formatNumber value="12345.678" pattern="0,000.0" /><br><%-- 해당 서식에 유효한 값은 처리, 무효한 값은 공백처리 --%>
숫자 : <fmt:formatNumber value="12" pattern="0,000.0" /><br> <%-- 무효지점을 0으로 처리 --%>
<br>
<c:set var="now" value="<%=new Date() %>" />
날짜 : <fmt:formatDate value="${now}" type="date" /><br>
시간 : <fmt:formatDate value="${now}" type="time" /><br>
모두 : <fmt:formatDate value="${now}" type="both" /><br>
모두 : <fmt:formatDate value="${now}" type="both" pattern="yyyy년 MM월 dd일" /><br>

</body>
</html>