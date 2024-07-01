package pack.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class SangpumModel {
	private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
	
	public List<SangpumDto> selectDataAll() {
		List<SangpumDto> list = null;	
		
		SqlSession session = factory.openSession();
		list = session.selectList("selectDataAll"); 
		session.close();
		
		return list;
	}
}
