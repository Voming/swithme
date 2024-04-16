package swithme.model.board.service;

import java.sql.Connection;
import java.util.List;

import static swithme.jdbc.common.JdbcTemplate.*;

import swithme.model.board.dao.BoardDao;
import swithme.model.board.dto.BoardDto;
import swithme.model.board.dto.BoardListDto;

public class BoardService {
	
	BoardDao dao = new BoardDao();
	
	//게시판 한 페이지에 뿌려지는 게시글 수 
	public List<BoardListDto> selectAllList() {
		List<BoardListDto> result = null;
		Connection conn = getConnection(true);
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
