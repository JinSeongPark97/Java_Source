package kr.mvc.model;

import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	 public static SqlSessionFactory sqlSessionFactory;  //DB의 SQL명령을 실행시킬 때 필요한 메소드를 갖고 있다.
	 
	  static{
	     String resource = "kr/mvc/mybatis/Configuration.xml"; // XML파일 읽기
	     try {
	         Reader reader = Resources.getResourceAsReader(resource); // configuration.xml을 읽음
	         sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); // 객체 생성
	         reader.close();
	     } catch (Exception e) {
	     System.out.println("SqlMapConfig 오류 : " + e);
	  }
	}
	 
	public static SqlSessionFactory getSqlSession(){  
	     return sqlSessionFactory;
	  }
	}