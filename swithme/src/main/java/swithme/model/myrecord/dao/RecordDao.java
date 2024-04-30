package swithme.model.myrecord.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import swithme.model.myrecord.dto.DateDifftimeDto;
import swithme.model.myrecord.dto.DayStudyTimeBySubjectDto;
import swithme.model.myrecord.dto.DayStudyTimeDto;
import swithme.model.myrecord.dto.RecordCalendarDto;
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
// 오늘의 과목 학습 시간 chart
	public List<DayStudyTimeBySubjectDto> dayStudyTime(SqlSession session,String memId){
			return session.selectList("record.dayStudyTime", memId);
	}	
// 과목별 학습 시간 4일치		
	public List<DayStudyTimeDto> fourdayStudyTime(SqlSession session,String memId){
			return session.selectList("record.fourdayStudyTime", memId);
	}
// 하루 학습시간 30일치
	public List<DateDifftimeDto> thirtydayStudyTime(SqlSession session,String memId){
		return session.selectList("record.thirtydayStudyTime", memId);
	}
// 과목별 하루 학습시간 30일치	
	public List<DayStudyTimeDto> thirtydayStudyTimeBySubject(SqlSession session,String memId){
		return session.selectList("record.thirtydayStudyTimeBySubject", memId);
	}
// 누적학습시간 
	public List<DateDifftimeDto> accStudyTime(SqlSession session,String memId){
		return session.selectList("record.accStudyTime", memId);
	}
// 달 별 총 학습시간
	public List<DateDifftimeDto> monthStudyTime(SqlSession session,String memId){
		return session.selectList("record.monthStudyTime", memId);
}
// 달 별 과목 총 학습시간	
	public List<DayStudyTimeDto> monthBySubject(SqlSession session,String memId){
		return session.selectList("record.monthBySubject", memId);
	}
// insert 공부시작 시간
	public int insertStartTime(SqlSession session, RecordTimeDto dto) {
		return session.insert("record.insertStartTime", dto);
	}
	
// update 공부종료시간
	public int insertEndTime(SqlSession session, RecordTimeDto dto) {
		return session.update("record.insertEndTime", dto);
	}

// 캘린더에 출력할 학습기록 list
	public List<RecordCalendarDto> studyTimeByCalList(SqlSession session,String memId) {
		return session.selectList("record.studyTimeByCalList",memId);
	}

//	유저 각오
	public String selectComment(SqlSession session,String memId) {
		return session.selectOne("record.selectComment", memId);
	}

}
