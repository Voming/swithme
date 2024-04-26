package swithme.model.testcalendar.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import swithme.jdbc.common.MybatisTemplate;
import swithme.model.testcalendar.dto.IndengineerDto;

public class TestCalDao {
	public int insert(List<IndengineerDto> dtolist) {
		SqlSession session =  MybatisTemplate.getSqlSession(false);
		int resultCount = 0;
		int result = 0;
		System.out.println("======== list size : "+ dtolist.size());
		for(int i=0; i < dtolist.size(); i++) {
//		for(int i=0; i < 2; i++) {
			IndengineerDto dto = dtolist.get(i);
			System.out.println(dto);
			try {
				result = session.insert("testcalendar.insertDescrInd", dto);
				System.out.println(result);
				System.out.println(dto.getDescrId());
				if(result > 0) {
					result = session.insert("testcalendar.insertIndEngineer", dto);
				} else {
					System.out.println("--2@$@$@$@#$-----------");
				}
			} catch (PersistenceException e){
				// 무결성 (unique) 하지 않을ㄸ째
				System.out.println("unique");
				result = session.update("testcalendar.updateIndEngineer", dto);
			}
			//resultCount += result;
		}
//		DESCR_ID          NOT NULL NUMBER 
//		DOCREGSTARTDT     NOT NULL DATE   
//		DOCREGENDDT       NOT NULL DATE   
//		DOCREGSTARTDT_EX           DATE   
//		DOCREGENDDT_EX             DATE   
//		DOCEXAMDT         NOT NULL DATE   
//		DOCPASSDT         NOT NULL DATE   
//		PRACREGSTARTDT    NOT NULL DATE   
//		PRACREGENDDT      NOT NULL DATE   
//		PRACREGSTARTDT_EX          DATE   
//		PRACREGENDDT_EX            DATE   
//		PRACEXAMSTARTDT   NOT NULL DATE   
//		PRACEXAMENDDT     NOT NULL DATE   
//		PRACPASSDT        NOT NULL DATE  
		
		session.commit();
		return result;
	}
}
