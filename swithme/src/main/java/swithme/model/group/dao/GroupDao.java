package swithme.model.group.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import swithme.jdbc.common.MybatisTemplate;
import swithme.model.group.dto.GroupCreateDto;
import swithme.model.group.dto.GroupDto;
import swithme.model.group.dto.GroupInfoDto;
import swithme.model.group.dto.GroupMylistDto;

public class GroupDao {

	// 나의 전체그룹 검색
	public List<GroupMylistDto> selectMyList(SqlSession session, String memberId) {
		List<GroupMylistDto> result = session.selectList("group.selectMyList", memberId);
		return result;
	}

	// 나의 그룹 수
	public int selectMyCount(SqlSession session, String memberId) {
		int result = session.selectOne("group.selectMyCount", memberId);
		return result;
	}

	// 공개 그룹 전체 범위 있음
	public List<GroupDto> selectAllOpenList(SqlSession session, int start, int end) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("startRounum", start);
		param.put("endRounum", end);

		List<GroupDto> result = session.selectList("group.selectAllOpenList", param);
		return result;
	}

	// 그룹 전체
	public List<GroupDto> selectAllList(SqlSession session) {
		List<GroupDto> result = session.selectList("group.selectAllList");
		return result;
	}

	public int insert(SqlSession session, GroupCreateDto dto) {

		int result = session.insert("group.insert", dto);
		return result;
	}

	// 선택된 그룹 하나 전체 정보
	public GroupInfoDto selectGroupInfo(SqlSession session, int groupId) {
		GroupInfoDto result = session.selectOne("group.selectGroupInfo", groupId);
		return result;
	}

	/*
	 * public int update(SqlSession session, String newgroupId, String groupId) {
	 * int result = 0; String sql = "UPDATE SGROUP SET MEM_ID=? WHERE SGROUP_ID=?";
	 * PreparedStatement pstmt = null; try { pstmt = conn.prepareStatement(sql);
	 * pstmt.setString(1, newgroupId); pstmt.setString(2, groupId);
	 * 
	 * result = pstmt.executeUpdate(); } catch (Exception e) { e.printStackTrace();
	 * } close(pstmt); return result; }
	 * 
	 * public int delete(SqlSession session, String groupId) { int result = 0;
	 * String sql = "DELETE FROM SGROUP WHERE SGROUP_ID=?"; PreparedStatement pstmt
	 * = null; try { pstmt = conn.prepareStatement(sql); pstmt.setString(1,
	 * groupId);
	 * 
	 * result = pstmt.executeUpdate(); } catch (Exception e) { e.printStackTrace();
	 * } close(pstmt); return result; }
	 */

}
