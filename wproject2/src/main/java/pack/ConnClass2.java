package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class ConnClass2 {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 연봉의 최대, 최소값
	public static int max = 0;
	public static int min = 2147483647;
	
	public ConnClass2() {
		try {
			Class.forName("org.mariadb.jdbc.Driver"); // WEB-INF → lib 폴더에 파일 jar파일 첨부
		} catch (Exception e) {
			System.out.println("ConnClass err : " + e);
		}
	}
	
	public ArrayList<JikwonDto> getData(String buser){
		ArrayList<JikwonDto> list = new ArrayList<JikwonDto>();
		try {
			String url = "jdbc:mariadb://localhost:3306/test";			
			conn = DriverManager.getConnection(url, "root", "123");
			String sql = "select jikwon_no,jikwon_name,jikwon_jik,jikwon_gen,jikwon_pay from jikwon"
					+ " where buser_num in (select buser_no from buser where buser_name=?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, buser);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				JikwonDto dto = new JikwonDto();
				dto.setNo(rs.getString("jikwon_no")); 
				dto.setName(rs.getString("jikwon_name")); 
				dto.setJik(rs.getString("jikwon_jik")); 
				dto.setGen(rs.getString("jikwon_gen"));
				list.add(dto);
				// sql 사용해서 구현 가능
				if(max < rs.getInt("jikwon_pay")) {
					max = rs.getInt("jikwon_pay");
				}
				if(min > rs.getInt("jikwon_pay")) {
					min = rs.getInt("jikwon_pay");
				}
			}
			
		} catch (Exception e) {
			
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			} catch (Exception e2) {
				
			}
		}
		return list;
	}

}
