package swithme.model.myrecord.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static swithme.jdbc.common.JdbcTemplate.*;

import swithme.model.myrecord.dto.SubjectAddDto;
import swithme.model.myrecord.dto.SubjectDeleteDto;
import swithme.model.myrecord.dto.SubjectDto;

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
	public String selectOne(Connection conn, String memid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sujectName = null;
		try {
			String sql = "select SUBJECT_NAME from subject where MEM_ID=? and SUBJECT_DEL_DATE IS NULL";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sujectName =rs.getString("SUBJECT_NAME");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return sujectName;
	}
	

	//과목 불러오기...? select 
	//TODO 유저 아이디에 맞는 것만
	public List<SubjectDto> select(Connection conn,String memId) {
		System.out.println(">>>>>>select  memId : "+memId);
		
		List<SubjectDto> result = null;
		String sql="SELECT * FROM SUBJECT WHERE MEM_ID = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = new ArrayList<SubjectDto>();
				do {

					SubjectDto dto = new SubjectDto(rs.getInt("SUBJECT_ID"), rs.getString("MEM_ID"), rs.getString("SUBJECT_NAME"), rs.getString("SUBJECT_ADD_DATE"), rs.getString("SUBJECT_ADD_DATE"), rs.getString("SUBJECT_COLOR"));
					result.add(dto);
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			System.out.println(">>>>>>select  result : "+result);
		close(rs);
		close(pstmt);
		return result;
	}
	
	
	//과목 추가 insert
	//public 
//	TODO subjectId 시퀀스 넣기
	public int insert(Connection conn, SubjectAddDto dto) {
		System.out.println(">>>>>>insert  dto : "+dto);
		 
		int result = 0;
		String sql="INSERT INTO SUBJECT VALUES(SEQ_SUBJECT_ID.nextval,?,?,DEFAULT,NULL,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubjectMemId());
			pstmt.setString(2, dto.getSubjectName());
			pstmt.setString(3, dto.getSubjectColor());
			
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(">>>>>>insert  result : "+result);
		
		close(pstmt);
		return result;
	}
	


	//과목 수정 update TODO
	public int update(Connection conn, SubjectAddDto dto) {
		//과목,맴버 ID를 조건으로 하는 행의 과목이름과 컬러 변경
		System.out.println(">>>>>>update  SubjectDto : "+dto);
		int result = 0;
		String sql="UPDATE SUBJECT SET SUBJECT_NAME = ? , SUBJECT_COLOR = ?  WHERE SUBJECT_ID = ? AND MEM_ID = ?  ";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			//?처리
			
			pstmt.setString(1, dto.getSubjectName());
			pstmt.setString(2, dto.getSubjectColor());
			pstmt.setString(4, dto.getSubjectMemId());
			
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(">>>>>>update  result : "+result);
		close(pstmt);
		return result;
	}
	
	/*후순위*/
	//과목 삭제 delete DEL_DATE = default //조건 : 과목,맴버 아이디 
	public int delete(Connection conn, SubjectDeleteDto dto) {
		System.out.println(">>>>>>delete SubjectDeleteDto : "+dto);
		int result = 0;
		String sql="UPDATE SUBJECT SET SUBJECT_DEL_DATE = DEFAULT  WHERE SUBJECT_ID = ? AND MEM_ID = ? ";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			//?처리
			pstmt.setInt(1, dto.getSubjectId());
			pstmt.setString(2, dto.getSubjectMemId());
		}catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(">>>>>>delete result : "+result);
		close(pstmt);
		return result;
	}
	
}
