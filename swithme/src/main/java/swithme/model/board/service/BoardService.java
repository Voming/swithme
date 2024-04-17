package swithme.model.board.service;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static swithme.jdbc.common.JdbcTemplate.*;

import swithme.model.board.dao.BoardDao;
import swithme.model.board.dto.BoardDto;
import swithme.model.board.dto.BoardListDto;

public class BoardService {
	
	BoardDao dao = new BoardDao();
	
	public Map<String, Object> selectPage(int boardNum, int boardPageNum, int currentPage) {
		//현재페이지: currentPage
		//게시판 페이지 하단에 표시할 페이지 수: boardPageNum
		//한 페이지 당 글 수: boardNum
		
		Map<String, Object> result = null;
		Connection conn = getConnection(false);
		
//		--총 게시글 개수 알아보기 
//		SELECT COUNT(*)/n개 FROM BOARD;
//		DB 가서 그때그때 알아와야함 - 게시글이 몇개이냐에 따라 달라질 수 있어서
		int totalboardCount = dao.selectTotalPageCount(conn);
		
		int start = boardNum*(currentPage-1)+1;
		int end = boardNum*currentPage;	
		
//		전체페이지수(총 게시글 개수/한 페이지 당 글 수) => (총 게시글 개수%한 페이지 당 글 수== 0)?(총 게시글 개수/한 페이지 당 글 수):(총 게시글 개수/한 페이지 당 글 수+1) 
		int totalPageCount = (totalboardCount%boardNum == 0)? (totalboardCount%boardNum) : (totalboardCount%boardNum) + 1;
							//조건문 - 앞에가 0이 맞으면 : 앞에꺼, 0이 아니면 : 뒤에꺼	
		
		//시작페이지 
		int startPageNum = (currentPage%boardPageNum == 0)? ((currentPage/boardPageNum)-1)*boardPageNum+1 : (currentPage/boardPageNum)*boardPageNum +1;
				
		//끝페이지
		int endPageNum= (startPageNum+boardPageNum > totalPageCount)? totalPageCount: startPageNum+boardPageNum -1;
		
		List<BoardListDto> dto = dao.selectPage(conn, start, end);
		close(conn);
		
		result = new HashMap<String, Object>();
		result.put(null, dto);
		
		
		return result;
		
		
	}
	
	
	//게시판에 게시글 나타내기
	public List<BoardListDto> selectAllList() {
		List<BoardListDto> result = null;
		Connection conn = getConnection(false);
		//true - localhost
		//false - 강사님꺼
		result = dao.selectAllList(conn);
		
		close(conn);
		return result;
	}
	
	
	//게시글 상세 페이지 들어가서 보는 것
	public BoardDto selectOne(int boardId) {
		BoardDto result = null;
		Connection conn = getConnection(true);
		result= dao.selectOne(conn, boardId);
		
		close(conn);
		return result;
		
	}
	
	//게시글 추가
	public int insert(BoardDto dto) {
		int result = 0;
		
		Connection conn = getConnection(true);
		result = dao.insert(conn, dto);
		
		close(conn);
		return result;
	}
	
	
	//게시글 수정
	public int update(BoardDto dto) {
		int result = 0;
		
		Connection conn = getConnection(true);
		result = dao.update(conn, dto);
		
		close(conn);
		return result;
	}
	
	//게시글 삭제
	public int delete(Integer boardId) {
		int result = 0;
		
		Connection conn = getConnection(true);
		result = dao.delete(conn, boardId);
		
		close(conn);
		return result;
	}
	
}
