package pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class ConnClass {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ConnClass() {
		try {
			Class.forName("org.mariadb.jdbc.Driver"); // WEB-INF → lib 폴더에 파일 jar파일 첨부
		} catch (Exception e) {
			System.out.println("ConnClass err : " + e);
		}
	}
	
	public ArrayList<SangpumDto> getDataAll(){
		ArrayList<SangpumDto> list = new ArrayList<SangpumDto>();
		try {
			String url = "jdbc:mariadb://localhost:3306/test";			
			conn = DriverManager.getConnection(url, "root", "123");
			pstmt = conn.prepareStatement("select * from sangdata");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SangpumDto dto = new SangpumDto();
				dto.setCode(rs.getString("code")); // rs.getString(1)
				dto.setSang(rs.getString("sang")); // rs.getString(1)
				dto.setSu(rs.getString("su")); 
				dto.setDan(rs.getString("dan")); 
				list.add(dto);
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
