package swithme.model.myrecord.service;

import static swithme.jdbc.common.MybatisTemplate.*;

import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import swithme.model.myrecord.dao.RecordDao;
import swithme.model.myrecord.dto.RecordDto;
import swithme.model.myrecord.dto.RecordTimeDto;
import swithme.model.myrecord.dto.SubjectDifftimeDto;

public class RecordService {
	
	
	private RecordDao dao = new RecordDao();
	
	//과목별 학습 시간과 당일 총 학습시간
	public List<SubjectDifftimeDto> subjectDifftime(String memId){
		System.out.println(">>>>>>rec dao subjectDifftime  memId : " + memId);
		List<SubjectDifftimeDto> result = null;
		SqlSession session = getSqlSession();
		result = dao.subjectDifftime(session,memId);
		System.out.println(">>>>>>rec subjectDifftime  result : " + result);
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
		System.out.println(">>>>>>rec select ");

		List<RecordDto> result = null;
		SqlSession session = getSqlSession();
		result = dao.select(session);
		System.out.println(">>>>>>rec select  result : " + result);
		session.close();
		return result;
	}

	// insert
	public int insertStartTime(RecordTimeDto dto) {
		System.out.println(">>>>>>rec insert  dto : " + dto);

		int result = -1;
		SqlSession session = getSqlSession();
		result = dao.insertStartTime(session, dto);
		System.out.println(">>>>>>rec insert  result : " + result);
		session.close();
		return result;
	}
	// insert
	public int insertEndTime(RecordTimeDto dto) {
		System.out.println(">>>>>>rec insert  dto : " + dto);

		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.insertEndTime(session, dto);
		System.out.println(">>>>>>rec insert  result : " + result);
		session.close();
		return result;
	}
	// rec은 delete,update없음

}
