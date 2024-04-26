package swithme.model.myrecord.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import swithme.model.myrecord.dto.SubjectAddDto;
import swithme.model.myrecord.dto.SubjectDeleteDto;
import swithme.model.myrecord.dto.SubjectDto;
import swithme.model.myrecord.dto.SubjectModifyDto;

public class SubjectDao {
//	private Integer subjectId;
//	private String subjectMemId;
//	private String subjectName;
//	private String subjectAddDate;
//	private String subjectDelDate;
//	private String subjectColor;
	
//	SUBJECT_ID       NOT NULL NUMBER       
//	MEM_ID           NOT NULL VARCHAR2(20) 
//	SUBJECT_NAME     NOT NULL VARCHAR2(20) 
//	SUBJECT_ADD_DATE NOT NULL TIMESTAMP(6) 
//	SUBJECT_DEL_DATE          TIMESTAMP(6) 
//	SUBJECT_COLOR    NOT NULL CHAR(1)   
	
	//과목이름
	public String selectOne(SqlSession session, String memId) {
		return session.selectOne("subject.selectOne", memId);
	}
	
	//과목 불러오기...? select 
	//TODO 유저 아이디에 맞는 것만
	public List<SubjectDto> select(SqlSession session,String memId) {
		return session.selectList("subject.select", memId);
	}
	
	
	//과목 추가 insert
	//public 
//	TODO subjectId 시퀀스 넣기
	public int insert(SqlSession session, SubjectAddDto dto) {
		return session.insert("subject.insert", dto);
	}

	//과목 수정 update TODO
	public int update(SqlSession session, SubjectModifyDto dto) {
		return session.update("subject.update", dto);
	}
	
	public int delete(SqlSession session, SubjectDeleteDto dto) {
		System.out.println("************sbuject delete   "+dto);
		return session.update("subject.delete", dto);
	}
	
}
