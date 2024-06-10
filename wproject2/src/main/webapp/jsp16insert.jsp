<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 입력자료를 전송 받아 insert를 하는 로직 = 서블릿으로 만들어도 상관 x
    request.setCharacterEncoding("utf-8");
    // String sang = request.getParameter("sang"); -> 대신 formbean 사용
    // ...
    %>
    <jsp:useBean id="sangpumBean" class="pack.SangpumBean" />
    <jsp:setProperty property="*" name="sangpumBean" />
    <%
    // 수신 데이터 검증 필요...
    %>
    <jsp:useBean id="connClass3" class="pack.ConnClass3" />
    <% 
    connClass3.insertData(sangpumBean);
	
    // 상품 추가 후 목록 보기
     response.sendRedirect("jsp16paging.jsp");
    
    // 주의 : 추가, 수정, 삭제 후 목록보기 할 때는 forwarding 하지 않는다.
    // request.getRequestDispatcher("jsp16paging.jsp").forward(request,response);
    // 위를 실행할 경우, 실행한 후 새로고침 시 반복수행으로 인해 계속 데이터가 추가된다.
	%>
	