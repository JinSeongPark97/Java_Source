package pack.business;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import pack.mybatis.SqlMapConfig;

public class ProcessDao {
	private static ProcessDao dao = new ProcessDao();

	// Singleton
	public static ProcessDao getInstance() {
		return dao;
	}
	
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession(); // factory는 Configuration.xml을 객체로 만들어 받음.
	
	// 여러개의 데이터를 반환
	public List<DataDto> selectDataAll() throws SQLException {
		SqlSession sqlSession = factory.openSession(); // 세션 열기 -> 웹 세션 x (단위프로그램)
		List list = sqlSession.selectList("selectDataAll"); // 인수로 DataMapper.xml의 select 태그의 id값을 전달.
		sqlSession.close();
		return list;
	}
	
	// 하나의 데이터를 반환
	public DataDto selectPart(String para) throws SQLException{
		SqlSession sqlSession = factory.openSession();
		DataDto dto = sqlSession.selectOne("selectDataById", para);
		sqlSession.close();
		return dto;
	}
	
	// 데이터 추가(수동 commit)
	public void insData(DataForm form) throws SQLException {
		SqlSession sqlSession = factory.openSession(); // transaction 수동 처리
		sqlSession.insert("insertData", form);
		sqlSession.commit(); // 해당 코드를 작성하지 않으면 auto commit이 아니므로 데이터가 추가되지 않음.
		sqlSession.close();
	}
	
	// 데이터 수정(자동 commit)
	public void upData(DataForm form) throws SQLException {
		SqlSession sqlSession = factory.openSession(true); // transaction 자동 처리
		sqlSession.update("updateData", form);
		sqlSession.close();
	}
	
	// 데이터 삭제(수동)
	public boolean delData(int para) {
		boolean result = false;
		SqlSession sqlSession = factory.openSession(); // transaction 수동 처리

		try {
			int cou = sqlSession.delete("deleteData", para);
			if(cou > 0) result = true;
			
			sqlSession.commit(); // 성공하면 commit
		} catch (Exception e) {
			System.out.println("delData err : " + e.getMessage());
			sqlSession.rollback(); // 실패하면 rollback
		} finally {
			if(sqlSession != null) sqlSession.close();
		}
		return result;
	}
}
