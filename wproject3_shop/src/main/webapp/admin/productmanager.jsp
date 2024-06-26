<%@page import="pack.product.ProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="productMgr" class="pack.product.ProductMgr" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
	<h2>전체 상품 목록(관리자)</h2>
	<%@ include file="admin_top.jsp"%>
	<table>
		<tr style="background-color: red;">
			<th>번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>등록일</th>
			<th>재고량</th>
			<th>상세보기</th>
		<%
		ArrayList<ProductDto> plist = productMgr.getproductAll();
		if (plist.size() == 0) {
		%>
		<tr>
			<td colspan="6">등록된 상품이 없습니다</td>
		</tr>
		<%
		}else{
			for(ProductDto p:plist) {
				
		%>
		<tr style="text-align: center;">
			<td><%=p.getNo() %></td>
			<td><%=p.getName() %></td>
			<td><%=p.getPrice() %></td>
			<td><%=p.getSdate() %></td>
			<td><%=p.getStock() %></td>
			<td>
			<a href="javascript:productDetail('<%=p.getNo() %>')">보기</a> <!-- 상품믜 번호를 들고감  -->
			</td>		
		</tr>
		<%
			}
		}
		%>
	<tr>
		<td colspan="6">
			[<a href="productinsert.jsp">상품 등록</a>]
		</td>
	</tr>	
</table>
<%@ include file="admin_bottom.jsp"%> 

<form action="productdetail.jsp" name="detailForm" method="post"> <!-- productdetail : 상품보기로 이동. -->
	<input type="hidden" name="no">
</form>

</body>
</html>