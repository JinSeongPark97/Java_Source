<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productMgr" class="pack.product.ProductMgr" />

<%
request.setCharacterEncoding("utf-8");
String flag = request.getParameter("flag");
boolean result = false;

if(flag.equals("insert")){
	result = productMgr.insertProduct(request); 
}else if(flag.equals("update")){
	result = productMgr.updateProduct(request);
}if(flag.equals("delete")){
	result = productMgr.deleteProduct(request.getParameter("no"));
}else{
	response.sendRedirect("productmanager.jsp");
}

if(result){ // 성공
%>
	<script>
		alert("정상 처리 되었습니다.")
		location.href="productmanager.jsp";
	</script>	
<% }else{%> <!-- 실패 -->
	<script>
		alert("오류 발생")
		location.href="productmanager.jsp";
	</script>
<%	
}
%>
