package swithme.model.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static swithme.jdbc.common.JdbcTemplate.close;

import swithme.model.board.dto.BoardDto;
import swithme.model.board.dto.BoardListDto;

public class BoardDao {

	//게시글 한 페이지에 나열
		public List<BoardListDto> selectAllList(Connection conn) {
			List<BoardListDto> result = null;
			String sql = "SELECT BOARD_ID, TITLE, BOARD_WRITER, WRITE_TIME, READ_COUNT  FROM BOARD";
			PreparedStatement pstmt = null;
			ResultSet rs = null;

			try {

				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					result = new ArrayList<BoardListDto>();
					do {

						BoardListDto dto = new BoardListDto(rs.getInt("BOARD_ID"), rs.getString("TITLE"),
								rs.getString("BOARD_WRITER"), rs.getString("WRITE_TIME"), rs.getInt("READ_COUNT"));
						result.add(dto);
					} while (rs.next());

				}
			} catch (SQLException e) {

			}
			close(rs);
			close(pstmt);
			return result;

		}
	
	
	//게시판 한 페이지에 나오는 총 게시글 수
	public int selectTotalCount(Connection conn) {
		int result = 0;
		String sql = "SELECT COUNT(*) c FROM BOARD";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("c");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return result;
	} 
	

	//게시글 하나 선택
	public BoardDto selectOne(Connection conn, Integer boardId) {
		BoardDto result = null;
		String sql = "SELECT * FROM BOARD WHERE BOARD_ID = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = new BoardDto(rs.getInt("BOARD_ID"), rs.getString("BOARD_WRITER"), rs.getString("TITLE"),
						rs.getString("CONTENT"), rs.getString("WRITE_TIME"), rs.getInt("READ_COUNT"),
						rs.getInt("BOARD_LIKE"));

			}

		} catch (SQLException e) {

		}

		return result;
	}

	//게시글 추가
	public int insert(Connection conn, BoardDto dto) {
		int result = 0;
		String sql = "INSERT INTO BOARD(BOARD_ID, BOARD_WRITER, TITLE, CONTENT, WRITE_TIME, READ_COUNT, BOARD_LIKE"
				+ "VALUES(SEQ_BOARD_ID.nextval,?, ?, ?, default, default, default)";
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(1, dto.getBoardWriter());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {

		}
		close(pstmt);
		return result;

	}

	//게시글 수정
	public int update(Connection conn, BoardDto dto) {
		int result = 0;
		String sql = "UPDATE BOARD SET TITLE = ?, CONTENT = ? WHERE BOARD_ID = ?";
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {

		}

		close(pstmt);
		return result;
	}

	//게시글 삭제
	public int delete(Connection conn, Integer boardId) {
		int result = 0;
		String sql = "DELETE FROM BOARD WHERE BOARD_ID =?";
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardId);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {

		}

		close(pstmt);
		return result;
	}

}
