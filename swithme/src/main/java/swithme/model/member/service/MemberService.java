package swithme.model.member.service;


import java.sql.Connection;
import java.util.List;

import swithme.model.member.dao.MemberDao;
import swithme.model.member.dto.MemberBoardListDto;
import swithme.model.member.dto.MemberDto;
import swithme.model.member.dto.MemberInfoDto;
import swithme.model.member.dto.MemberLoginDto;

import static swithme.jdbc.common.JdbcTemplate.*;

public class MemberService {
	private MemberDao dao = new MemberDao(); 
	
	//select login get info
	public MemberInfoDto loginGetInfo(MemberLoginDto dto) {
		MemberInfoDto result = null;
		Connection conn = getConnection(false);
		result = dao.loginGetInfo(conn, dto);
		close(conn);
		return result;
	}
	
	//login
	public int login(MemberLoginDto dto) {
		int result = 0;
		Connection conn = getConnection(false);
		result = dao.login(conn, dto);
		close(conn);
		return result;
	}
	
	// select checkId
	public int selectCheckId(String memId) {
		int result = 0;
		Connection conn = getConnection(false);
		result = dao.selectCheckId(conn, memId);
		close(conn);
		return result;
	}
	
	//select all
	public List<MemberDto> selectAllList() {
		List<MemberDto> result = null;
		Connection conn = getConnection(false);
		result = dao.selectAllList(conn);
		close(conn);
		return result;
	}
	
	//select all - boardlist
	public List<MemberBoardListDto> selectAllBoardList() {
		List<MemberBoardListDto> result = null;
		Connection conn = getConnection(false);
		result = dao.selectAllBoardList(conn);
		close(conn);
		return result;
	}
	
	// select one
	public MemberDto selectOne(String memId) {
		MemberDto result = null;
		Connection conn = getConnection(false);
		result = dao.selectOne(conn, memId);
		close(conn);
		return result;
	}
	// insert
	public int insert(MemberDto dto) {
		int result = 0;
		Connection conn = getConnection(false);
		result = dao.insert(conn, dto);
		close(conn);
		return result;
	}
	// update
	public int update(MemberDto dto) {
		int result = 0;
		Connection conn = getConnection(false);
		result = dao.update(conn, dto);
		close(conn);
		return result;
	}
	// delete
	public int delete(String memId) {
		int result = 0;
		Connection conn = getConnection(false);
		result = dao.delete(conn, memId);
		close(conn);
		return result;
	}
}