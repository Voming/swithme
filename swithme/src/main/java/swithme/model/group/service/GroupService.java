package swithme.model.group.service;

import static swithme.jdbc.common.JdbcTemplate.*;

import java.sql.Connection;
import java.util.List;

import swithme.model.group.dao.GroupDao;
import swithme.model.group.dto.GroupDto;

public class GroupService {
	private GroupDao dao = new GroupDao();
	
	public int selectOne(String groupName) {
		int result = 0;
		Connection conn = getConnection(false);
		result = dao.selectOne(conn, groupName);
		close(conn);
		return result;
	}

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
