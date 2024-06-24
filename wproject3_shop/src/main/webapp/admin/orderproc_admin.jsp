<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="orderMgr" class="pack.order.OrderMgr" />    

<%
String flag = request.getParameter("flag");
String no = request.getParameter("no");
String state = request.getParameter("state");

boolean b = false;

if(flag.equals("update")){ // 업데이트 시
	b = orderMgr.updateOrder(no, state); // no를 수정 

}else if(flag.equals("delete")){ // 삭제 시
	b = orderMgr.deleteOrder(no);
}else{
	response.sendRedirect("ordermanager.jsp"); //
}

if(b){ /* 성공 시 */
%>
	<script>
	alert("정상적으로 처리되었습니다.");
	location.href="ordermanager.jsp";
	</script>
<%	
}else{	/* 실패 시 */
%>
	<script>
	alert("작업 실패")
	location.href="ordermanager.jsp";
	</script>
<%	
}
%>