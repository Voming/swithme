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
			//List 형태로 선언만해놓고 값을 집어넣지 않음 => 값을 넣어두면 어디서 오류가 떴는지 모름...
			//List는 추상클래스(인터페이스) 라서 그 자체를 사용하지 못하고 하위 얘들을 불러와서 List에 값을 넣어줘야함
			//*인터페이스 - 자료형으로는 쓸 수 있는데 객체로는 사용할 수 X
			//List라는 형태 자체는 존재하기 때문에 여기에 값 넣는거 가능
			//	ex. 바가지에 물 떠와! => 바가지가 List
			// 		바가지라는 형태인데 구체적으로 어떤 바가지에 담아? 빨간색바가지? 파란색바가지? -> 이게 ArrayList
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

		// 게시판에서 게시글 list 전체 수 구하기 - 페이지 수 계산하려함
		//ex. 게시글이 총 20개면 5개로 나눈다 했을때 총 4페이지 나옴
		//총 페이지 수가 결정됨 - 숫자만 뽑는거
	public int selectTotalPageCount(Connection conn) {
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
	
	
	// 페이지 당 나오는 게시글 수 뽑기
	//위에꺼 토대로 얘가 배치됨 - 게시글 관련 데이터까지 뽑는거
	public List<BoardListDto> selectPage(Connection conn, int start, int end) {
		List<BoardListDto> result = null;
		String sql = "SELECT T2.*" + "   FROM (SELECT T1.*, ROWNUM RN"
				+ "       FROM (SELECT BOARD_ID, TITLE, WRITE_TIME, BOARD_WRITER, READ_COUNT FROM BOARD ORDER BY BOARD_ID DESC) T1 ) T2"
				+ "   WHERE RN BETWEEN ?   AND ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			pstmt.setInt(1, start);// 한페이지당글수*(현재페이지-1)+1
			pstmt.setInt(2, end);// 한페이지당글수*(현재페이지)
			rs = pstmt.executeQuery();
			// ResetSet처리
			if (rs.next()) {
				result = new ArrayList<BoardListDto>();
				do {
					BoardListDto dto = new BoardListDto(rs.getInt("BOARD_ID"), rs.getString("TITLE"),
							rs.getString("WRITE_TIME"), rs.getString("BOARD_WRITER"), rs.getInt("READ_COUNT"));
					result.add(dto);
				} while (rs.next());
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
