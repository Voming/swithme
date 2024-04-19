package swithme.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import swithme.model.board.dto.BoardContentDto;

import swithme.model.board.dto.BoardDto;
import swithme.model.board.dto.BoardInsertDto;
import swithme.model.board.dto.BoardListDto;

public class BoardDao {

	//게시글 한 페이지에 나열
		public List<BoardListDto> selectAllList(SqlSession session) {
			List<BoardListDto> result = session.selectList("board.selectAllList");
			return result;

		}

		// 게시판에서 게시글 list 전체 수 구하기 - 페이지 수 계산하려함
		//ex. 게시글이 총 20개면 5개로 나눈다 했을때 총 4페이지 나옴
		//총 페이지 수가 결정됨 - 숫자만 뽑는거
	public int selectTotalPageCount(SqlSession session) {
		int result =  session.selectOne("board.selectTotalPageCount");
		
		return result;
	} 
	
	
	// 페이지 당 나오는 게시글 수 뽑기
	//위에꺼 토대로 얘가 배치됨 - 게시글 관련 데이터까지 뽑는거
	public List<BoardListDto> selectPage(SqlSession session, int start, int end) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("startRounum", start);
		param.put("endRounum", end);
 		List<BoardListDto> result =session.selectList("board.selectPage", param);
		
		return result;
	}
	
	

	//게시글 하나 선택
	public BoardContentDto selectOne(SqlSession session, Integer boardId) {
		BoardContentDto result = session.selectOne("board.selectOne", boardId);
		
		System.out.println("BoardContentDto : " + result);
		return result;
		
		
	}


	//게시글 추가
	public int insert(SqlSession session, BoardInsertDto dto) {
	
		int result = session.insert("board.insert", dto);
		return result;

	}

	//게시글 수정
	public int update(SqlSession session, BoardDto dto) {
		int result = session.insert("board.update", dto);
		
		return result;
	}

	//게시글 삭제
	public int delete(SqlSession session, Integer boardId) {
		int result = session.delete("board.delete", boardId);
		return result;
	}

}
