package swithme.model.group.service;

import static swithme.jdbc.common.JdbcTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import swithme.model.group.dao.GroupDao;
import swithme.model.group.dto.GroupDto;

public class GroupService {
	private GroupDao dao = new GroupDao();

	// 나의 전체그룹 검색
	public List<GroupDto> selectMyList(String memberId) {
		List<GroupDto> result = null;
		Connection conn = getConnection(false);
		result = dao.selectMyList(conn, memberId);
		close(conn);
		return result;
	}

	// 나의 그룹 수
	public int selectMyCount(String groupName) {
		int result = 0;
		Connection conn = getConnection(false);
		result = dao.selectMyCount(conn, groupName);
		close(conn);
		return result;
	}

	// 공개 그룹 전체 범위 있음
	public List<GroupDto> selectAllOpenList(int start, int end) {
		List<GroupDto> result = null;
		Connection conn = getConnection(false);
		result = dao.selectAllOpenList(conn, start, end);
		close(conn);
		return result;
	}

	// 그룹 전체
	public List<GroupDto> selectAllList() {
		List<GroupDto> result = null;
		Connection conn = getConnection(false);
		result = dao.selectAllList(conn);
		close(conn);
		return result;
	}

	public int insert(GroupDto dto) {
		int result = 0;
		Connection conn = getConnection(false);
		result = dao.insert(conn, dto);
		close(conn);
		return result;
	}

	public int update(String newgroupId, String groupId) {
		int result = 0;
		Connection conn = getConnection(false);
		result = dao.update(conn, newgroupId, groupId);
		close(conn);
		return result;
	}

	public int delete(String groupId) {
		int result = 0;
		Connection conn = getConnection(false);
		result = dao.delete(conn, groupId);
		close(conn);
		return result;
	}

}
