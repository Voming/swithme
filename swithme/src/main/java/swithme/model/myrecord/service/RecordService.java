package swithme.model.myrecord.service;

import static swithme.jdbc.common.JdbcTemplate.close;
import static swithme.jdbc.common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

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
		Connection conn = getConnection(false);
		result = dao.subjectDifftime(conn,memId);
		System.out.println(">>>>>>rec subjectDifftime  result : " + result);
		close(conn);
		return result;

	}
	// selectOne
	public RecordDto selectOne(int recordSubjectId) {
		RecordDto vo = null;
		Connection conn = getConnection(false);
		vo = dao.selectOne(conn, recordSubjectId);
		close(conn);
		return vo;
	}

	// select all
	public List<RecordDto> select() {
		System.out.println(">>>>>>rec select ");

		List<RecordDto> result = null;
		Connection conn = getConnection(false);
		result = dao.select(conn);
		System.out.println(">>>>>>rec select  result : " + result);
		close(conn);
		return result;
	}

	// insert
	public int insertStartTime(RecordTimeDto dto) {
		System.out.println(">>>>>>rec insert  dto : " + dto);

		int result = -1;
		Connection conn = getConnection(false);
		result = dao.insertStartTime(conn, dto);
		System.out.println(">>>>>>rec insert  result : " + result);
		close(conn);
		return result;
	}
	// insert
	public int insertEndTime(RecordTimeDto dto) {
		System.out.println(">>>>>>rec insert  dto : " + dto);

		int result = 0;
		Connection conn = getConnection(false);
		result = dao.insertEndTime(conn, dto);
		System.out.println(">>>>>>rec insert  result : " + result);
		close(conn);
		return result;
	}
	// rec은 delete,update없음

}
