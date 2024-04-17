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
	//selectOne
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
				vo = new RecordDto(rs.getInt("RECORD_ID"),rs.getInt("RECORD_SUBJECT_ID"), rs.getString("RECORD_MEM_ID"), rs.getString("RECORD_START"), rs.getString("RECORD_END"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return vo;
	}
	
	//select
	public List<RecordDto> select(Connection conn) {
		System.out.println(">>>>>>rec select  memId : ");
		
		List<RecordDto> result = null;
		String sql="SELECT * FROM RECORD";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = new ArrayList<RecordDto>();
				do {

					RecordDto dto = new RecordDto(rs.getInt("RECORD_ID"),rs.getInt("RECORD_SUBJECT_ID"), rs.getString("RECORD_MEM_ID"), rs.getString("RECORD_START"), rs.getString("RECORD_END"));
					result.add(dto);
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			System.out.println(">>>>>>rec select  result : "+result);
		close(rs);
		close(pstmt);
		return result;
	}
	
	//update
	public int insert(Connection conn, RecordDto dto) {
		System.out.println(">>>>>>rec insert  dto : "+dto);
		//RECORD_ID         NOT NULL NUMBER       
		//RECORD_SUBJECT_ID NOT NULL NUMBER       
		//RECORD_MEM_ID     NOT NULL VARCHAR2(20) 
		//RECORD_START      NOT NULL TIMESTAMP(6) 
		//RECORD_END                 TIMESTAMP(6) 
		int result = 0;
		String sql="INSERT INTO SUBJECT VALUES(?,?,?,DEFAULT,NULL)"; //타임 부분이 어떻게 넣어야할지 모르겠음
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getRecordId());
			pstmt.setInt(2, dto.getRecordSubjectId());
			pstmt.setString(3, dto.getRecordMemId());
			
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(">>>>>>rec insert  result : "+result);
		
		close(pstmt);
		return result;
	}
	//update,delete...???
}
