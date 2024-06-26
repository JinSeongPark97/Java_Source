<%@page import="pack.product.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="productMgr" class="pack.product.ProductMgr" />    
<% 
ProductDto dto = productMgr.getProduct(request.getParameter("no"));
%>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<%@ include file="admin_top.jsp"%> <!-- 세션 체크 : admin한 사람만 접근이 가능함 -->
<form action="productproc.jsp?flag=update" method="post" enctype="multipart/form-data"> <!-- 파일 전달을 위해 enctype 속성 설정 -->
<table>
	<tr>
		<td colspan="2">상품 수정</td>
	</tr>
	<tr>
		<td>상품명</td>	
		<td><input type="text" name="name" value="<%=dto.getName()%>"></td>
	</tr>
	<tr>
		<td>가격</td>	
		<td><input type="text" name="price" value="<%=dto.getPrice()%>"></td>
	</tr>
	<tr>
		<td>설명</td>	
		<td>
			<textarea rows="5" style="width:99%" name="detail" value="<%=dto.getDetail()%>" ></textarea>
		</td>
	</tr>
	<tr>
		<td>재고량</td>	
		<td><input type="text" name="stock" value="<%=dto.getStock()%>"></td>
	</tr>
	<tr>
		<td>이미지</td>	
		<td>
			<img src="../upload/<%=dto.getImage()%>">
			<input type="file" name="image" size="30">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<br>
			<input type="hidden" name="no" value="<%=dto.getNo() %>">
			<input type="submit" value="상품 수정">
			<input type="reset" value="수정 취소" onclick="history.back()"> <!-- history.back() : 한 페이지 뒤로가기 -->
		</td>	
	</tr>
	
</table>
</form>	

<%@ include file="admin_bottom.jsp"%> 
</body>
</html>