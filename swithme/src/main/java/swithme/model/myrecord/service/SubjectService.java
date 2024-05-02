package swithme.model.myrecord.service;


import static swithme.jdbc.common.MybatisTemplate.*;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import swithme.model.myrecord.dao.RecordDao;
import swithme.model.myrecord.dao.SubjectDao;
import swithme.model.myrecord.dto.SubjectAddDto;
import swithme.model.myrecord.dto.SubjectDeleteDto;
import swithme.model.myrecord.dto.SubjectDifftimeDto;
import swithme.model.myrecord.dto.SubjectDto;
import swithme.model.myrecord.dto.SubjectModifyDto;

public class SubjectService {
	private SubjectDao dao = new SubjectDao();
	private RecordDao daoRecord = new RecordDao();
	
	//과목 이름만 
	public String selectOne(String memid) {
		String sujectName = null;
		SqlSession session = getSqlSession();
		sujectName= dao.selectOne(session, memid);
		session.close();
		return sujectName;
	}
	
	//과목 불러오기...? select 
	public List<SubjectDto> select(String memId) {
		
		List<SubjectDto> result = null;
		SqlSession session = getSqlSession();
		result = dao.select(session, memId);
		session.close();
		return result;
	}
	
	
	//과목 추가 insert - 후 결과화면 조회 한번에 하기 (ajax)
	public List<SubjectDifftimeDto> insertSubjectAndSelectRecord( SubjectAddDto dto) {
		
		List<SubjectDifftimeDto> result = null;
		//int insertResult = -1;
		SqlSession session = getSqlSession();

		// insert subject
		//insertResult = dao.insert(session, dto);
		
		// select record
		// 과목추가에 성공 여부와 상관없이 화면을 다시 display 해야 하므로 정보를 조회해 옴
		result = daoRecord.subjectDifftime(session, dto.getSubjectMemId());
		
		session.close();
		return result;
	}
	

	//과목 추가 insert
	public int insert( SubjectAddDto dto) {
		int result = -1;
		SqlSession session = getSqlSession();

		// insert subject
		result = dao.insert(session, dto);
		
		session.close();
		return result;
	}
	

	//과목 수정 update
	public int update(SubjectModifyDto dto) {
		//과목,맴버 ID를 조건으로 하는 행의 과목이름과 컬러 변경
		int result = -1;
		SqlSession session = getSqlSession();
		result = dao.update(session, dto);
		session.close();
		return result;
	}
	
	/*후순위*/
	//과목 삭제 delete DEL_DATE = default //조건 : 과목,맴버 아이디 
	public int delete(SubjectDeleteDto dto) {
		int result = -1;
		SqlSession session = getSqlSession();
		result = dao.delete(session, dto);
		session.close();
		return result;
	}
	
}
