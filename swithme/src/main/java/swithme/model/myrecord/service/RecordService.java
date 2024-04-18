package swithme.model.myrecord.service;

import static swithme.jdbc.common.JdbcTemplate.close;
import static swithme.jdbc.common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import swithme.model.myrecord.dao.RecordDao;
import swithme.model.myrecord.dto.RecordDto;
import swithme.model.myrecord.dto.SubjectDifftimeDto;

public class RecordService {
	
	
	private RecordDao dao = new RecordDao();
	
	//과목별 학습 시간과 당일 총 학습시간
	public List<SubjectDifftimeDto> SubjectDifftime(String memId){
		System.out.println(">>>>>>rec dao SubjectDifftime  memId : " + memId);
		List<SubjectDifftimeDto> result = null;
		Connection conn = getConnection(false);
		result = dao.SubjectDifftime(conn,memId);
		System.out.println(">>>>>>rec SubjectDifftime  result : " + result);
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
		Connection conn = getConnection(true);
		result = dao.select(conn);
		System.out.println(">>>>>>rec select  result : " + result);
		close(conn);
		return result;
	}

	// insert
	public int insert(RecordDto dto) {
		System.out.println(">>>>>>rec insert  dto : " + dto);

		int result = 0;
		Connection conn = getConnection(true);
		result = dao.insert(conn, dto);
		System.out.println(">>>>>>rec insert  result : " + result);
		close(conn);
		return result;
	}

	// rec은 delete,update없음

}
