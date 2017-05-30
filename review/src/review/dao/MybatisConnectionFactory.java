package review.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MybatisConnectionFactory {
	
	private static SqlSessionFactory sqlSessionFactory;
	
	static{
		try {
			Reader reader = Resources.getResourceAsReader("review/dao/config.xml");
			
			if(sqlSessionFactory == null){
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			}
		}catch (FileNotFoundException e) {
			
			e.printStackTrace();
		}catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}
	
	public static SqlSession getSqlSession(){
		return sqlSessionFactory.openSession();
	}

}
