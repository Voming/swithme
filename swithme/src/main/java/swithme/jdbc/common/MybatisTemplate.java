package swithme.jdbc.common;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisTemplate {
	public static SqlSession getSqlSession() {   //매개인자 없으면 autocommit true 기본
		SqlSession session = null;
	
		String resource = "mybatis-config.xml";
		try {
			
			InputStream stream = Resources.getResourceAsStream(resource);  
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = builder.build(stream);
			
			session = factory.openSession(true); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return session;
	}
	
	
	public static SqlSession getSqlSession(boolean autocommit) { 
		SqlSession session = null;
		
//		1. mybatis-config.xml의 설정 정보를 InputStream 객체를 통해 읽어옴
//		2. SqlSessionFactoryBuilder 객체를 생성하고 build() 메소드를 통해 SqlSessionFactory 객체를 생성
//		3. SqlSessionFactory 객체의 openSession() 메소드를 통해 SqlSession 객체 생성
		
		String resource = "mybatis-config.xml";
		try {
			//io.InputStream 사용
			InputStream stream = Resources.getResourceAsStream(resource);  
			//많이 써서 static으로 getResourceAsStream만들어둠
			//또는 크기가 커서 close가 필요할 경우 static
			
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = builder.build(stream);
			
			session = factory.openSession(autocommit);  //autocommit 할지말지
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return session;
	}
}
