<%@page import="java.sql.DriverManager"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
{"jikwon":
[
<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
	    // DB 연결하기
		Class.forName("org.mariadb.jdbc.Driver");
		String url = "jdbc:mariadb://localhost:3306/test";
		conn = DriverManager.getConnection(url, "root", "123");

		// sql문
		String sql = "select jikwon_no, jikwon_name, jikwon_jik, " +
		                "year(jikwon_ibsail) as jikwon_year, jikwon_gen from jikwon";

       
        String jikwonGen = request.getParameter("gender");

        if (jikwonGen.equals("남") || jikwonGen.equals("여")) {
            sql += " where jikwon_gen='" + jikwonGen + "'";
        } else { }

		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		String result = "";
		while (rs.next()) {
			result += "{";
			
			result += "\"jikwon_no\":" + "\"" + rs.getString("jikwon_no") + "\",";
			result += "\"jikwon_name\":" + "\"" + rs.getString("jikwon_name") + "\",";
			result += "\"jikwon_jik\":" + "\"" + rs.getString("jikwon_jik") + "\",";
			result += "\"jikwon_year\":" + "\"" + rs.getString("jikwon_year") + "\",";
			result += "\"jikwon_gen\":" + "\"" + rs.getString("jikwon_gen") + "\"";
			result += "},";
		}

		if(result.length() > 0) {
			result = result.substring(0, result.length() - 1);
		}
		out.print(result);

	} catch (Exception e) {
		System.out.println("loading failed : " + e);
	} finally {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {

		}

	}

%>
]
}