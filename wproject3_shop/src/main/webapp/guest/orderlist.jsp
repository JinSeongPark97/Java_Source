<%@page import="pack.product.ProductDto"%>
<%@page import="pack.order.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="orderMgr" class="pack.order.OrderMgr" /> <!-- 상품번호만 보이므로 다음 행을 통해 상품명을 끌고옴 -->    
<jsp:useBean id="productMgr" class="pack.product.ProductMgr" /> <!-- 여기서 상품명을 가져올 예정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
</head>
<body>
<h2>주문 상품 정보</h2>
<%@ include file="guest_top.jsp" %>
<table>
   <tr style="background-color: black; color:white">
      <th>주문번호</th><th>상품명</th><th>주문수량</th><th>주문일</th><th>주문상태</th>
   </tr>
<%
String id = (String)session.getAttribute("idKey"); // 세션 생성

ArrayList<OrderBean> list = orderMgr.getOrder(id); // OrderMgr 객체의 getOrder(id)를 메소드 호출 = id인 사람의 장바구니 내역을 접근
if(list.isEmpty()) { // list가 비어있는지 체크
%>
	<tr>
		<td colspan="5"><%=id %>&nbsp;회원님 주문한 상품이 없습니다</td>
	</tr>
<%		
}else{
	for(OrderBean ord:list){
		ProductDto product = productMgr.getProduct(ord.getProduct_no());
		
%>
	<tr align="center" bgcolor="pink" style="font-style: italic;"> 
		<td><%=ord.getNo() %></td> <!-- 주문번호 -->
		<td><%=product.getName() %></td> <!-- 상품명 -->
		<td><%=ord.getQuantity() %></td>	<!-- 주문수량 -->
		<td><%=ord.getSdate() %></td> <!-- 주문일 -->
		<!--
		<td><%=ord.getState() %></td>
		-->
		<!-- // 1:접수, 2:입금확인, 3:배송준비, 4:배송중, 5:처리완료 -->
		<td>
		<%
		switch(ord.getState()){
		case "1" : out.println("접수"); break;
		case "2" : out.println("입금확인"); break;
		case "3" : out.println("배송준비"); break;
		case "4" : out.println("배송중"); break;
		case "5" : out.println("처리완료"); break;
		default : out.println("접수중"); break;
		}
		%>	
		</td>	
	</tr>
<%		
	}
}
%>   
</table>
<%@ include file="guest_bottom.jsp" %>
   
</body>
</html>