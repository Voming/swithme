package swithme.model.myrecord.service;

import static swithme.jdbc.common.JdbcTemplate.close;
import static swithme.jdbc.common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import swithme.model.myrecord.dao.RecordDao;
import swithme.model.myrecord.dto.RecordDto;

public class RecordService {
	private RecordDao dao = new RecordDao();

	// selectOne
	public RecordDto selectOne(int recordSubjectId) {
		RecordDto vo = null;
		Connection conn = getConnection(true);
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
