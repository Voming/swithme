package swithme.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import swithme.model.board.dto.BoardDto;
import swithme.model.board.dto.BoardInsertDto;
import swithme.model.board.dto.BoardContentDto;
import swithme.model.board.dto.BoardListDto;
import swithme.model.board.dto.BoardReplyDto;
import swithme.model.board.dto.BoardUpdateDto;

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
		System.out.println(boardId);
		BoardContentDto result = session.selectOne("board.selectOne", boardId);
		
		System.out.println("BoardContentDao : " + result);
		
		return result;
			
	}
	
	//댓글 
	public List<BoardReplyDto> selectBoardReplyList(SqlSession session, Integer boardId) {
		
		return session.selectList("board.selectBoardReplyList", boardId);
		
		
	}

	//게시글 추가
	public int insert(SqlSession session, BoardInsertDto dto) {
	
		int result = session.insert("board.insert", dto);
		System.out.println("게시글 추가 dao : " + result);
		return result;

	}
	
	//댓글 작성
	public int insertReplyWrite(SqlSession session, BoardReplyDto replydto) {
		int result = session.insert("board.insertReplyWrite", replydto);
		System.out.println("댓글작성 dao: " + result);
		return result;
		//return 값 뿌리고 싶으면 result 값에 담아준 다음에 뿌리기
		// => session.insert("board.insertReplyWrite", replydto) 이거를 sysout에 뿌리면 
		//		댓글이 화면에 두번 출력됨
	}
	
	//대댓글 작성
	public int insertReplyWriteAgain(SqlSession session, BoardReplyDto replydto) {
		int result = session.insert("board.insertReplyWriteAgain", replydto);
		System.out.println("대댓글작성 dao: " + result);
		return result;

	}
	

	//게시글 수정
	public int update(SqlSession session, BoardUpdateDto dto) {
		int result = session.update("board.update", dto);
		
		return result;
	}
	
	
	//게시글 삭제
	public int delete(SqlSession session, Integer boardId) {
		int result = session.delete("board.delete", boardId);
		return result;
	}

}
