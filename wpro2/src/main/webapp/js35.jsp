<?xml version="1.0" encoding="UTF-8"?> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<sangpums>
<%
// sangdata 테이블을 읽어 XML 형식으로 출력
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	Class.forName("org.mariadb.jdbc.Driver"); // WEB-INF → lib 폴더에 파일 jar파일 첨부
	
	String url = "jdbc:mariadb://localhost:3306/test";
	conn = DriverManager.getConnection(url, "root", "123");
	pstmt = conn.prepareStatement("select * from sangdata");
	rs = pstmt.executeQuery();
	
	// rs.next();
	// out.print(rs.getString("sang"));
	while(rs.next()){	// 이 다음 행에서 자바를 빠져나온다.
%>		
		<sangpum>
			<code><% out.print(rs.getString("code")); // 다음 행과 동일 out.print를 =로 대체가능. 단, 세미콜론은 제거해야 함 %></code>    
			<sangname><%= rs.getString("sang") %></sangname>
			<su><%= rs.getString("su") %></su>
			<danga><%= rs.getString("dan") %></danga> 
		</sangpum>	
		
<%		
	}
}catch(Exception e){
	System.out.println("에러 : " + e);
	return;
}finally{
	try{
	rs.close();
	pstmt.close();
	conn.close();
}catch (Exception e){
	
}
}

	


%>	
</sangpums>