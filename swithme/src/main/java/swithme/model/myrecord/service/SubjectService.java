package swithme.model.myrecord.service;

import static swithme.jdbc.common.JdbcTemplate.*;

import java.sql.Connection;
import java.util.List;

import swithme.model.myrecord.dao.SubjectDao;
import swithme.model.myrecord.dto.SubjectAddDto;
import swithme.model.myrecord.dto.SubjectDeleteDto;
import swithme.model.myrecord.dto.SubjectDto;

public class SubjectService {
	private SubjectDao dao = new SubjectDao();
	
	//과목 불러오기...? select 
	//TODO 유저 아이디에 맞는 것만
	public List<SubjectDto> select(String memId) {
		System.out.println(">>>>>>serv select  memId : "+memId);
		
		List<SubjectDto> result = null;
		Connection conn = getConnection(true);
		result = dao.select(conn, memId);
			System.out.println(">>>>>>serv select  result : "+result);
		close(conn);
		return result;
	}
	
	
	//과목 추가 insert
	//public 
//	TODO subjectId 시퀀스 넣기
	public int insert( SubjectAddDto dto) {
		System.out.println(">>>>>>serv insert  dto : "+dto);
		 
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.insert(conn, dto);
		System.out.println(">>>>>>serv insert  result : "+result);
		close(conn);
		return result;
	}
	


	//과목 수정 update
	public int update(SubjectAddDto dto) {
		//과목,맴버 ID를 조건으로 하는 행의 과목이름과 컬러 변경
		System.out.println(">>>>>>update  SubjectDto : "+dto);
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.update(conn, dto);
			System.out.println(">>>>>>serv update  result : "+result);
		close(conn);
		return result;
	}
	
	/*후순위*/
	//과목 삭제 delete DEL_DATE = default //조건 : 과목,맴버 아이디 
	public int delete(SubjectDeleteDto dto) {
		System.out.println(">>>>>>delete SubjectDeleteDto : "+dto);
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.delete(conn, dto);
			System.out.println(">>>>>>serv delete  result : "+result);
		close(conn);
		return result;
	}
	
}
