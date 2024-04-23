package swithme.model.group.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import swithme.jdbc.common.MybatisTemplate;

import swithme.model.group.dao.GroupDao;
import swithme.model.group.dto.GroupCreateDto;
import swithme.model.group.dto.GroupDto;
import swithme.model.group.dto.GroupInfoListDto;
import swithme.model.group.dto.GroupMemberDto;
import swithme.model.group.dto.GroupMylistDto;
import swithme.model.group.dto.GroupRecordDaySumDto;
import swithme.model.group.dto.GroupRecordSumDto;
import swithme.model.group.dto.GroupUpdateDto;
import swithme.model.group.dto.GroupUpdateMinDto;

public class GroupService {
	private GroupDao dao = new GroupDao();

	// 나의 전체그룹 검색
	public List<GroupMylistDto> selectMyList(String memberId) {
		List<GroupMylistDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.selectMyList(session, memberId);
		session.close();
		return result;
	}

	// 나의 그룹 수
	public int selectMyCount(String groupName) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.selectMyCount(session, groupName);
		session.close();
		return result;
	}

	// 공개 그룹 전체 범위 있음
	public List<GroupDto> selectAllOpenList(int start, int end) {
		List<GroupDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.selectAllOpenList(session, start, end);
		session.close();
		return result;
	}

	// 랜덤 추천 그룹 20개 가져오기
	public List<GroupDto> selectRandList() {
		List<GroupDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.selectRandList(session);
		session.close();
		return result;
	}

	// 그룹 찾기
	public List<GroupDto> selectFindList(String findName) {
		List<GroupDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.selectFindList(session, findName);
		session.close();
		return result;
	}

	// 그룹 전체
	public List<GroupDto> selectAllList() {
		List<GroupDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.selectAllList(session);
		session.close();
		return result;
	}

	// 그룹 생성
	public int insert(GroupCreateDto dto) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		int myGCount = dao.selectMyCount(session, dto.getSgroupWriter());

		if (myGCount >= 5) {
			result = -1;
		} else {
			result = dao.insert(session, dto);
		}

		session.close();
		return result;
	}

	// 선택된 그룹 하나 전체 정보
	public List<GroupInfoListDto> selectGroupInfoList(int groupId) {
		List<GroupInfoListDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.selectGroupInfoList(session, groupId);
		session.close();
		return result;
	}

	// 선택된 그룹 하나 전체 정보
	public GroupDto selectGroupInfoOne(int groupId) {
		GroupDto result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.selectGroupInfoOne(session, groupId);
		session.close();
		return result;
	}
	
	//그룹 멤버 일주일 공부량
	public List<GroupRecordSumDto> selectGroupRecordSumList(int groupId) {
		List<GroupRecordSumDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.selectGroupRecordSumList(session, groupId);
		session.close();
		return result;
	}

	//그룹 멤버 하루 공부량
	public List<GroupRecordDaySumDto> selectGroupRecordDaySumList(int groupId) {
		List<GroupRecordDaySumDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.selectGroupRecordDaySumList(session, groupId);
		session.close();
		return result;
	}
	
	//사진 포함 업데이트
	public int update(GroupUpdateDto dto) {
		int result = 0;
		System.out.println(dto);
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.update(session, dto);
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}

	//사진 제외 업데이트
	public int updateMin(GroupUpdateMinDto dto) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.updateMin(session, dto);
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}
	//그룹 나가기
	public int deletMemberGroup(GroupMemberDto dto) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.deletMemberGroup(session, dto);
		session.close();
		return result;
	}
	

}
