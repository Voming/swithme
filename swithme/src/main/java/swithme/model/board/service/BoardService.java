package swithme.model.board.service;

import java.sql.Connection;
import java.util.List;

import static swithme.jdbc.common.JdbcTemplate.*;

import swithme.model.board.dao.BoardDao;
import swithme.model.board.dto.BoardDto;
import swithme.model.board.dto.BoardListDto;

public class BoardService {
	
	BoardDao dao = new BoardDao();
	

	public List<BoardListDto> selectAllList() {
		List<BoardListDto> result = null;
		Connection conn = getConnection(true);
		result = dao.selectAllList(conn);
		
		close(conn);
		return result;
	}
	
	public BoardDto selectOne(int boardId) {
		BoardDto result = null;
		Connection conn = getConnection(true);
		result= dao.selectOne(conn, boardId);
		
		close(conn);
		return result;
		
	}
	
	public int insert(BoardDto dto) {
		int result = 0;
		
		Connection conn = getConnection(true);
		result = dao.insert(conn, dto);
		
		close(conn);
		return result;
	}
	
	public int update(BoardDto dto) {
		int result = 0;
		
		Connection conn = getConnection(true);
		result = dao.update(conn, dto);
		
		close(conn);
		return result;
	}
	
	public int delete(Integer boardId) {
		int result = 0;
		
		Connection conn = getConnection(true);
		result = dao.delete(conn, boardId);
		
		close(conn);
		return result;
	}
	
}
