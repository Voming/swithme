package swithme.model.myrecord.service;


import static swithme.jdbc.common.JdbcTemplate.*;

import java.sql.Connection;
import java.util.List;

import swithme.model.myrecord.dao.RecordDao;
import swithme.model.myrecord.dao.SubjectDao;
import swithme.model.myrecord.dto.SubjectAddDto;
import swithme.model.myrecord.dto.SubjectDeleteDto;
import swithme.model.myrecord.dto.SubjectDifftimeDto;
import swithme.model.myrecord.dto.SubjectDto;

public class SubjectService {
	private SubjectDao dao = new SubjectDao();
	private RecordDao daoRecord = new RecordDao();
	
	//과목 이름만 
	public String selectOne(String memid) {
		String sujectName = null;
		Connection conn = getConnection(false);
		sujectName= dao.selectOne(conn, memid);
		close(conn);
		return sujectName;
	}
	
	//과목 불러오기...? select 
	//TODO 유저 아이디에 맞는 것만
	public List<SubjectDto> select(String memId) {
		System.out.println(">>>>>>serv select  memId : "+memId);
		
		List<SubjectDto> result = null;
		Connection conn = getConnection(false);
		result = dao.select(conn, memId);
			System.out.println(">>>>>>serv select  result : "+result);
		close(conn);
		return result;
	}
	
	
	//과목 추가 insert - 후 결과화면 조화 한번에 하기 (ajax)
	public List<SubjectDifftimeDto> insertSubjectAndSelectRecord( SubjectAddDto dto) {
		System.out.println(">>>>>>serv insertSubjectAndSelectRecord  dto : "+dto);
		
		List<SubjectDifftimeDto> result = null;
		int insertResult = -1;
		Connection conn = getConnection(false);

		// insert subject
		insertResult = dao.insert(conn, dto);
		
		// select record
		// 과목추가에 성공 여부와 상관없이 화면을 다시 display 해야 하므로 정보를 조회해 옴
		result = daoRecord.subjectDifftime(conn, dto.getSubjectMemId());
		
		System.out.println(">>>>>>serv insert  result : "+result);
		close(conn);
		return result;
	}
	

	//과목 추가 insert
	public int insert( SubjectAddDto dto) {
		System.out.println(">>>>>>serv insert  dto : "+dto);
		
		int result = -1;
		Connection conn = getConnection(false);

		// insert subject
		result = dao.insert(conn, dto);
		
		System.out.println(">>>>>>serv insert  result : "+result);
		close(conn);
		return result;
	}
	

	//과목 수정 update
	public int update(SubjectAddDto dto) {
		//과목,맴버 ID를 조건으로 하는 행의 과목이름과 컬러 변경
		System.out.println(">>>>>>update  SubjectDto : "+dto);
		int result = -1;
		Connection conn = getConnection(false);
		result = dao.update(conn, dto);
			System.out.println(">>>>>>serv update  result : "+result);
		close(conn);
		return result;
	}
	
	/*후순위*/
	//과목 삭제 delete DEL_DATE = default //조건 : 과목,맴버 아이디 
	public int delete(SubjectDeleteDto dto) {
		System.out.println(">>>>>>delete SubjectDeleteDto : "+dto);
		int result = -1;
		Connection conn = getConnection(false);
		result = dao.delete(conn, dto);
			System.out.println(">>>>>>serv delete  result : "+result);
		close(conn);
		return result;
	}
	
}
