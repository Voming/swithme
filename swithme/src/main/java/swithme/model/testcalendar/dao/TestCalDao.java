package swithme.model.testcalendar.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import swithme.jdbc.common.MybatisTemplate;
import swithme.model.testcalendar.dto.IndengineerDto;
import swithme.model.testcalendar.dto.MastercraftsmentDto;
import swithme.model.testcalendar.dto.ProengineerDto;

public class TestCalDao {
	public int insertInd(List<IndengineerDto> dtolist) {
		SqlSession session =  MybatisTemplate.getSqlSession(false);
	
		int result = 0;
		System.out.println("======== list size : "+ dtolist.size());
		for(int i=0; i < dtolist.size(); i++) {
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
				System.out.println("unique");
				result = session.update("testcalendar.updateIndEngineer", dto);
			}
			
		}		
		session.commit();
		session.close();
		return result;
	}
	
	public int insertMaster(List<MastercraftsmentDto> dtolist) {
		SqlSession session =  MybatisTemplate.getSqlSession(false);
	
		int result = 0;
		System.out.println("======== list size : "+ dtolist.size());
		for(int i=0; i < dtolist.size(); i++) {
			MastercraftsmentDto dto = dtolist.get(i);
			System.out.println(dto);
			try {
				result = session.insert("testcalendar.insertDescrMaseter", dto);
				System.out.println(result);
				System.out.println(dto.getDescrId());
				if(result > 0) {
					result = session.insert("testcalendar.insertMasterCraftsment", dto);
				} else {
					System.out.println("--2@$@$@$@#$-----------");
				}
			} catch (PersistenceException e){
				System.out.println("unique");
				result = session.update("testcalendar.updateMasterCraftsment", dto);
			}
			
		}		
		session.commit();
		session.close();
		return result;
	}
	
	public int insertPro(List<ProengineerDto> dtolist) {
		SqlSession session =  MybatisTemplate.getSqlSession(false);
	
		int result = 0;
		System.out.println("======== list size : "+ dtolist.size());
		for(int i=0; i < dtolist.size(); i++) {
			ProengineerDto dto = dtolist.get(i);
			System.out.println(dto);
			try {
				result = session.insert("testcalendar.insertDescrPro", dto);
				System.out.println(result);
				System.out.println(dto.getDescrId());
				if(result > 0) {
					result = session.insert("testcalendar.insertProEngineer", dto);
				} else {
					System.out.println("--2@$@$@$@#$-----------");
				}
			} catch (PersistenceException e){
				System.out.println("unique");
				result = session.update("testcalendar.updateProEngineer", dto);
			}
			
		}		
		session.commit();
		session.close();
		return result;
	}
}
