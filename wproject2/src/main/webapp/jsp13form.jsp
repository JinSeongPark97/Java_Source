<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("utf-8");
    
    String name = request.getParameter("name"); // 과거에 이랬다.
    
    %>
    <jsp:useBean id="bean" class="pack.ExamBean" />
    <!--  
    <jsp:setProperty property="name" name="bean"/> // 수신값이 적을 때.
	...
	-->
	<jsp:setProperty property="*" name="bean" /> <!-- 자동으로 수신된 값이 ExamBean의 멤버필드에 저장 -->
	
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
FormBean에 등록된 자료 출력하기<br>
이름 : <jsp:getProperty property="name" name="bean"/><br>	<!-- getter에는 "*" 사용할 수 없음. -->
국어 : <jsp:getProperty property="kor" name="bean"/><br>
영어 : <jsp:getProperty property="eng" name="bean"/><br>
수학 : <jsp:getProperty property="mat" name="bean"/><br>
<jsp:useBean id="process" class="pack.ExamProcess" />
<jsp:setProperty property="bean" name="process" value="<%=bean %>"/>
총점 : <jsp:getProperty property="tot" name="process"/>
<br>
평균 :
총점 : <jsp:getProperty property="avg" name="process"/>
<br>


</body>
</html>