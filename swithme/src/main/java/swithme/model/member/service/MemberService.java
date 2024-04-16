package swithme.model.member.service;


import java.sql.Connection;
import java.util.List;

import swithme.model.member.dao.MemberDao;
import swithme.model.member.dto.MemberDto;


import static swithme.jdbc.common.JdbcTemplate.*;

public class MemberService {
	private MemberDao dao = new MemberDao(); 
	
	//select login get info

	
	//login

	
	
	// select checkId
	
		
	
	//select all
	public List<MemberDto> selectAllList() {
		List<MemberDto> result = null;
		Connection conn = getConnection(true);
		result = dao.selectAllList(conn);
		close(conn);
		return result;
	}
	// select one
	public MemberDto selectOne(String memId) {
		MemberDto result = null;
		Connection conn = getConnection(true);
		result = dao.selectOne(conn, memId);
		close(conn);
		return result;
	}
	// insert
	public int insert(MemberDto dto) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.insert(conn, dto);
		close(conn);
		return result;
	}
	// update
	public int update(MemberDto dto) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.update(conn, dto);
		close(conn);
		return result;
	}
	// delete
	public int delete(String memId) {
		int result = 0;
		Connection conn = null;
		result = dao.delete(conn, memId);
		close(conn);
		return result;
	}
}