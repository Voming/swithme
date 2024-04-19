package swithme.model.myrecord.dao;

import static swithme.jdbc.common.JdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import swithme.model.myrecord.dto.RecordDto;
import swithme.model.myrecord.dto.SubjectAddDto;
import swithme.model.myrecord.dto.SubjectDeleteDto;
import swithme.model.myrecord.dto.SubjectDifftimeDto;
import swithme.model.myrecord.dto.SubjectDto;
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
	public List<SubjectDifftimeDto> subjectDifftime(Connection conn,String memId){
		System.out.println(">>>>>>rec SubjectDifftime  memId : " + memId);

		List<SubjectDifftimeDto> result = null;
		String sql = "select SUBJECT_ID, SUBJECT_NAME ,DIFFTIME    "
				+ " from (SELECT SUBJECT_ID, SUBJECT_NAME  FROM SUBJECT WHERE MEM_ID =? AND SUBJECT_DEL_DATE IS NULL) t1   "
				+ " FULL JOIN  "
				+ " ( SELECT RECORD_SUBJECT_ID, SUBSTR(NUMTODSINTERVAL( SUM( CAST(RECORD_END as DATE) - CAST(RECORD_START as DATE) ), 'day' ), 12, 8) as DIFFTIME  "
				+ "   FROM RECORD WHERE RECORD_MEM_ID =?  and to_char(RECORD_START, 'yyyymmdd') =  to_char(SYSDATE, 'yyyymmdd')  "
				+ "   group by cube(RECORD_SUBJECT_ID) ) t2  "
				+ " on (SUBJECT_ID = RECORD_SUBJECT_ID)  "
				+ " ORDER BY SUBJECT_ID ASC NULLS FIRST  " ;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			pstmt.setString(2, memId);
    
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = new ArrayList<SubjectDifftimeDto>();
				do {

					SubjectDifftimeDto dto = new SubjectDifftimeDto(rs.getInt("SUBJECT_ID"),
							rs.getString("SUBJECT_NAME"), rs.getString("DIFFTIME"));
					result.add(dto);
					
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(">>>>>>rec select  result : " + result);
		close(rs);
		close(pstmt);
		return result;
	}

//	-----------------------------------------------------
	// selectOne
	public RecordDto selectOne(Connection conn, int recordId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		RecordDto vo = null;
		try {
			String sql = "SELECT * FROM RECORD WHERE RECORD_ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, recordId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo = new RecordDto(rs.getInt("RECORD_ID"), rs.getInt("RECORD_SUBJECT_ID"),
						rs.getString("RECORD_MEM_ID"), rs.getString("RECORD_START"), rs.getString("RECORD_END"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return vo;
	}

	// select
	public List<RecordDto> select(Connection conn) {
		System.out.println(">>>>>>rec select  memId : ");

		List<RecordDto> result = null;
		String sql = "SELECT * FROM RECORD";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = new ArrayList<RecordDto>();
				do {

					RecordDto dto = new RecordDto(rs.getInt("RECORD_ID"), rs.getInt("RECORD_SUBJECT_ID"),
							rs.getString("RECORD_MEM_ID"), rs.getString("RECORD_START"), rs.getString("RECORD_END"));
					result.add(dto);
				} while (rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(">>>>>>rec select  result : " + result);
		close(rs);
		close(pstmt);
		return result;
	}

	// update
	public int insert(Connection conn, RecordDto dto) {
		System.out.println(">>>>>>rec insert  dto : " + dto);
		// RECORD_ID NOT NULL NUMBER
		// RECORD_SUBJECT_ID NOT NULL NUMBER
		// RECORD_MEM_ID NOT NULL VARCHAR2(20)
		// RECORD_START NOT NULL TIMESTAMP(6)
		// RECORD_END TIMESTAMP(6)
		int result = 0;
		String sql = "INSERT INTO SUBJECT VALUES(?,?,?,DEFAULT,NULL)"; // 타임 부분이 어떻게 넣어야할지 모르겠음
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getRecordId());
			pstmt.setInt(2, dto.getRecordSubjectId());
			pstmt.setString(3, dto.getRecordMemId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		System.out.println(">>>>>>rec insert  result : " + result);

		close(pstmt);
		return result;
	}
	// update,delete...???
}
