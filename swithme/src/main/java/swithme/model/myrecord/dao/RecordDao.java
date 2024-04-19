package swithme.model.myrecord.dao;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import swithme.model.myrecord.dto.RecordDto;
import swithme.model.myrecord.dto.RecordTimeDto;
import swithme.model.myrecord.dto.SubjectDifftimeDto;
//RECORD_ID         NOT NULL NUMBER       
//RECORD_SUBJECT_ID NOT NULL NUMBER       
//RECORD_MEM_ID     NOT NULL VARCHAR2(20) 
//RECORD_START      NOT NULL TIMESTAMP(6) 
//RECORD_END                 TIMESTAMP(6) 

//private Integer recordId;
//private Integer recordSubjectId;
//private String recordMemId;
//private String recordStart; //timestamp
//private String recordEnd;	//timestamp

public class RecordDao {
	
// 오늘의 과목 학습 시간 
	public List<SubjectDifftimeDto> subjectDifftime(SqlSession session,String memId){
		return session.selectList("record.subjectDifftime", memId);
	}

//	-----------------------------------------------------
	// selectOne
	public RecordDto selectOne(SqlSession session, int recordId) {
		return session.selectOne("record.selectOne", recordId);
	}

	// select
	public List<RecordDto> select(SqlSession session) {
		return session.selectList("record.select");
	}

	// insert 공부시작 시간
	public int insertStartTime(SqlSession session, RecordTimeDto dto) {
		return session.insert("record.insertStartTime", dto);
	}
	
	
	public int insertEndTime(SqlSession session, RecordTimeDto dto) {
		return session.update("record.insertEndTime", dto);
	}
	// update,delete...???
}
