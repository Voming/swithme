package swithme.model.myrecord.service;

import static swithme.jdbc.common.MybatisTemplate.*;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import swithme.model.myrecord.dao.RecordDao;
import swithme.model.myrecord.dto.DateDifftimeDto;
import swithme.model.myrecord.dto.DayStudyTimeBySubjectDto;
import swithme.model.myrecord.dto.DayStudyTimeDto;
import swithme.model.myrecord.dto.RecordDto;
import swithme.model.myrecord.dto.RecordTimeDto;
import swithme.model.myrecord.dto.SubjectDifftimeDto;

public class RecordService {
	
	
	private RecordDao dao = new RecordDao();
	
	//과목별 학습 시간과 당일 총 학습시간
	public List<SubjectDifftimeDto> subjectDifftime(String memId){
		List<SubjectDifftimeDto> result = null;
		SqlSession session = getSqlSession();
		result = dao.subjectDifftime(session,memId);
		session.close();
		return result;
	}
	// 오늘의 과목 학습 시간 chart
	public List<DayStudyTimeBySubjectDto> dayStudyTime(String memId){
		List<DayStudyTimeBySubjectDto> result = null;
		SqlSession session = getSqlSession();
		result = dao.dayStudyTime(session,memId);
		session.close();
		return result;
	}
	
	//4일치 과목별 학습 시간 chart
	public List<DayStudyTimeDto> fourdayStudyTime(String memId){
		List<DayStudyTimeDto> result = null;
		SqlSession session = getSqlSession();
		result = dao.fourdayStudyTime(session,memId);
		session.close();
		return result;
	}
	// 하루 학습시간 30일치
	public List<DateDifftimeDto> thirtydayStudyTime(String memId){
		List<DateDifftimeDto> result = null;
		SqlSession session = getSqlSession();
		result = dao.thirtydayStudyTime(session,memId);
		session.close();
		return result;
	}
	// 과목별 하루 학습시간 30일치
	public List<DayStudyTimeDto> thirtydayStudyTimeBySubject(String memId){
		List<DayStudyTimeDto> result = null;
		SqlSession session = getSqlSession();
		result = dao.thirtydayStudyTimeBySubject(session,memId);
		session.close();
		return result;
	}
	//누적학습시간 accStudyTime
	public List<DateDifftimeDto> accStudyTime(String memId){
		List<DateDifftimeDto> result = null;
		SqlSession session = getSqlSession();
		result = dao.accStudyTime(session,memId);
		session.close();
		return result;
	}
	// 달 별 총 학습시간
	public List<DateDifftimeDto> monthStudyTime(String memId){
		List<DateDifftimeDto> result = null;
		SqlSession session = getSqlSession();
		result = dao.monthStudyTime(session,memId);
		session.close();
		return result;
	}
	// 달 별 과목 총 학습시간	
	public List<DayStudyTimeDto> monthBySubject(String memId){
		List<DayStudyTimeDto> result = null;
		SqlSession session = getSqlSession();
		result = dao.monthBySubject(session,memId);
		session.close();
		return result;
	}
	// insert
	public int insertStartTime(RecordTimeDto dto) {

		int result = -1;
		SqlSession session = getSqlSession();
		result = dao.insertStartTime(session, dto);
		session.close();
		return result;
	}
	// update 
	public int insertEndTime(RecordTimeDto dto) {

		int result = -1;
		SqlSession session = getSqlSession();
		result = dao.insertEndTime(session, dto);
		session.close();
		return result;
	}
	
	// selectOne
	public RecordDto selectOne(int recordSubjectId) {
		RecordDto vo = null;
		SqlSession session = getSqlSession();
		vo = dao.selectOne(session, recordSubjectId);
		session.close();
		return vo;
	}

	// select all
	public List<RecordDto> select() {

		List<RecordDto> result = null;
		SqlSession session = getSqlSession();
		result = dao.select(session);
		session.close();
		return result;
	}
	// rec은 delete,update없음

}
