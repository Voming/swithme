package swithme.model.group.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import swithme.model.group.dto.GroupCreateDto;
import swithme.model.group.dto.GroupDto;
import swithme.model.group.dto.GroupInfoDto;
import swithme.model.group.dto.GroupMylistDto;
import swithme.model.group.dto.GroupRecordSumDto;
import swithme.model.group.dto.GroupUpdateDto;
import swithme.model.group.dto.GroupUpdateMinDto;

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

	// 랜덤 추천 그룹 20개 가져오기
	public List<GroupDto> selectRandList(SqlSession session) {
		List<GroupDto> result = session.selectList("group.selectRandList");
		return result;
	}
	
	//그룹 찾기
	public List<GroupDto> selectFindList(SqlSession session, String findName) {
		List<GroupDto> result = session.selectList("group.selectFindList", findName);
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

	public List<GroupRecordSumDto> selectGroupRecordSumList(SqlSession session, int groupId) {
		List<GroupRecordSumDto> result = session.selectList("group.selectGroupRecordSumList", groupId);
		return result;
	}

	public int test(SqlSession session, String memId) {
		int result = session.selectOne("group.test", memId);
		return result;
	}

	public int update(SqlSession session, GroupUpdateDto dto) {
		int result = session.update("group.update", dto);
		return result;
	}

	public int updateMin(SqlSession session, GroupUpdateMinDto dto) {
		int result = session.update("group.updateMin", dto);
		return result;
	}

	/*
	 * public int delete(SqlSession session, String groupId) { int result = 0;
	 * String sql = "DELETE FROM SGROUP WHERE SGROUP_ID=?"; PreparedStatement pstmt
	 * = null; try { pstmt = conn.prepareStatement(sql); pstmt.setString(1,
	 * groupId);
	 * 
	 * result = pstmt.executeUpdate(); } catch (Exception e) { e.printStackTrace();
	 * } close(pstmt); return result; }
	 */

}
