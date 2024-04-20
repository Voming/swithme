package swithme.model.group.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import swithme.jdbc.common.MybatisTemplate;
import swithme.model.group.dao.GroupDao;
import swithme.model.group.dto.GroupCreateDto;
import swithme.model.group.dto.GroupDto;
import swithme.model.group.dto.GroupMylistDto;

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

	// 그룹 전체
	public List<GroupDto> selectAllList() {
		List<GroupDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.selectAllList(session);
		session.close();
		return result;
	}
	// 그룹 생성
	public int insert(GroupCreateDto dto, String memberId) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		int myGCount =  dao.selectMyCount(session, memberId);
		System.out.println(myGCount);
		if(myGCount >= 5) {
			result = -1;
		}else {
			result = dao.insert(session, dto);
		}
		
		session.close();
		return result;
	}

/*	public int update(String newgroupId, String groupId) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.update(session, newgroupId, groupId);
		session.close();
		return result;
	}

	public int delete(String groupId) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.delete(session, groupId);
		session.close();
		return result;
	}*/

}
