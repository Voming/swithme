package swithme.model.group.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import swithme.model.group.dto.GroupCreateDto;
import swithme.model.group.dto.GroupDto;
import swithme.model.group.dto.GroupInfoListDto;
import swithme.model.group.dto.GroupMemberDto;
import swithme.model.group.dto.GroupMylistDto;
import swithme.model.group.dto.GroupRecordDaySumDto;
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

	// 공개 그룹 전체 (범위 있음)
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

	// 그룹 찾기
	public List<GroupDto> selectFindList(SqlSession session, String findName) {
		List<GroupDto> result = session.selectList("group.selectFindList", findName);
		return result;
	}

	// 그룹 전체
	public List<GroupDto> selectAllList(SqlSession session) {
		List<GroupDto> result = session.selectList("group.selectAllList");
		return result;
	}

	// 그룹 추가
	public int insert(SqlSession session, GroupCreateDto dto) {
		int result = session.insert("group.insert", dto);
		return result;
	}

	// 선택된 그룹 하나 전체 정보(그룹원 포함)
	public List<GroupInfoListDto> selectGroupInfoList(SqlSession session, int groupId) {
		List<GroupInfoListDto> result = session.selectList("group.selectGroupInfoList", groupId);
		return result;
	}

	// 선택된 그룹 하나 전체 정보(그룹원 제외)
	public GroupDto selectGroupInfoOne(SqlSession session, int groupId) {
		GroupDto result = session.selectOne("group.selectGroupInfoOne", groupId);
		return result;
	}

	// 일주일당 공부량
	public List<GroupRecordSumDto> selectGroupRecordSumList(SqlSession session, int groupId) {
		List<GroupRecordSumDto> result = session.selectList("group.selectGroupRecordSumList", groupId);
		return result;
	}

	// 하루당 공부량
	public List<GroupRecordDaySumDto> selectGroupRecordDaySumList(SqlSession session, int groupId) {
		List<GroupRecordDaySumDto> result = session.selectList("group.selectGroupRecordDaySumList", groupId);
		return result;
	}

	// 사진 포함 업데이트
	public int update(SqlSession session, GroupUpdateDto dto) {
		int result = session.update("group.update", dto);
		return result;
	}

	// 사진 제외 업데이트
	public int updateMin(SqlSession session, GroupUpdateMinDto dto) {
		int result = session.update("group.updateMin", dto);
		return result;
	}

	// 그룹 탈퇴
	public int deletMemberGroup(SqlSession session, GroupMemberDto dto) {
		int result = session.delete("group.deletMemberGroup", dto);
		return result;
	}

	// 그룹 안 그룹원 수
	public int selectMemCount(SqlSession session, int groupId) {
		int result = session.selectOne("group.selectMemCount", groupId);
		return result;
	}

	// 그룹 삭제하기
	public int deleteGroup(SqlSession session, int groupId) {
		int result = session.delete("group.deleteGroup", groupId);
		return result;
	}

	// 가입하려는 그룹 비밀번호 체크
	public String selectJoinPwd(SqlSession session, int groupId) {
		String result = session.selectOne("group.selectJoinPwd", groupId);
		return result;
	}

	// 그룹 가입
	public int insertJoinMember(SqlSession session, GroupMemberDto dto) {
		int result = session.insert("group.insertJoinMember", dto);
		return result;
	}
	
	// 가입된 그룹인지 체크
	public int selectJoinCheck(SqlSession session, GroupMemberDto dto) {
		int result = session.selectOne("group.selectJoinCheck", dto);
		return result;
	}
}
