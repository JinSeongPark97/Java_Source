<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="boardMgr" class="pack.board.BoardMgr" />
<jsp:useBean id="dto" class="pack.board.BoardDto" />


<%
String num = request.getParameter("num");
String spage = request.getParameter("page");

//  상세보기 하면 조회수 증가
boardMgr.updateReadcnt(num);
dto = boardMgr.getData(num);

String name = dto.getName();
String pass = dto.getPass();
String mail = dto.getMail();
String title = dto.getTitle();
String cont = dto.getCont();
String bip = dto.getBip();
String bdate = dto.getBdate();
int readcnt = dto.getReadcnt();
// out.print(name + " " + title);

String adminPass = "*****"; // 로그인 하지 않으면 비밀번호 안보이기
String adminOk = (String)session.getAttribute("adminOk"); // 회원가입 후 로그인에 성공하면 세션을 생성한다고 가정하고 세션 읽기
if(adminOk != null){
	if(adminOk.equalsIgnoreCase("admin")) adminPass = pass;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
</head>
<body>
	<table>
		<tr>
			<td><b>비밀번호 : <%=adminPass %></b></td>
			<td colspan="2" style="text-align: right;"><a
				href="reply.jsp?num=<%=num %>&page=<%=spage %>"> <img
					src="../images/reply.gif" />
			</a> <a href="edit.jsp?num=<%=num %>&page=<%=spage %>"> <img
					src="../images/edit.gif" />
			</a> <a href="delete.jsp?num=<%=num %>&page=<%=spage %>"> <img
					src="../images/del.gif" />
			</a> <a href="boardlist.jsp?page=<%=spage %>"> <img
					src="../images/list.gif" />
			</a></td>
		</tr>
		<tr>
			<td>작성자 : <a href="mailto:<%= mail %>"><%= name %></a> (ip : <%=bip %>)
			</td>
			<td>작성일 : <%= bdate %>
			</td>
			<td>조회수 : <%= readcnt %>
			</td>
		</tr>
		<tr>
			<td colspan="3" style="background-color: cyan">제목 : <%= title %>
			</td>
		</tr>
		<tr>
			<td colspan="3"><textarea rows="10" style="width: 99%" readonly><%=cont %></textarea>
			</td>
		</tr>
	</table>
</body>
</html>