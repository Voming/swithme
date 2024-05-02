package swithme.model.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import swithme.jdbc.common.MybatisTemplate;
import swithme.model.board.dao.BoardDao;
import swithme.model.board.dto.BoardContentDto;
import swithme.model.board.dto.BoardDto;
import swithme.model.board.dto.BoardInsertDto;
import swithme.model.board.dto.BoardListDto;
import swithme.model.board.dto.BoardReplyDto;
import swithme.model.board.dto.BoardUpdateDto;

public class BoardService {

	BoardDao dao = new BoardDao();

	public Map<String, Object> selectPage(int boardNum, int boardPageNum, int currentPage, String memId) {

		// 현재페이지: currentPage
		// 게시판 페이지 하단에 표시할 페이지 수: boardPageNum
		// 한 페이지 당 글 수: boardNum

		Map<String, Object> result = null;
		SqlSession session = MybatisTemplate.getSqlSession();

//		--총 게시글 개수 알아보기 
//		SELECT COUNT(*)/n개 FROM BOARD;
//		DB 가서 그때그때 알아와야함 - 게시글이 몇개이냐에 따라 달라질 수 있어서
		int totalboardCount = dao.selectTotalPageCount(session, memId);
		//나의 게시글에서 memId가 쓴 게시글에 따라 게시글 수가 달라지기 때문에 필요
		
		System.out.println("totalboardCount: "+totalboardCount);
		
		int start = boardNum * (currentPage - 1) + 1;
		int end = boardNum * currentPage;

//		전체페이지수(총 게시글 개수/한 페이지 당 글 수) => (총 게시글 개수%한 페이지 당 글 수== 0)?(총 게시글 개수/한 페이지 당 글 수):(총 게시글 개수/한 페이지 당 글 수+1) 
		int totalPageCount = (totalboardCount % boardNum == 0) ? (totalboardCount / boardNum)
				: (totalboardCount / boardNum) + 1;
		// 조건문 - 앞에가 0이 맞으면 : 앞에꺼, 0이 아니면 : 뒤에꺼

		// 시작페이지
		int startPageNum = (currentPage % boardPageNum == 0) ? ((currentPage / boardPageNum) - 1) * boardPageNum + 1
				: (currentPage / boardPageNum) * boardPageNum + 1;

		// 끝페이지
		int endPageNum = (startPageNum + boardPageNum > totalPageCount) ? totalPageCount
				: startPageNum + boardPageNum - 1;

		List<BoardListDto> boardlistdto = dao.selectPage(session, start, end, memId);
		session.close();

		result = new HashMap<String, Object>();
		result.put("boardlistdto", boardlistdto);
		result.put("totalboardCount", totalboardCount);
		result.put("startPageNum", startPageNum);
		result.put("endPageNum", endPageNum);
		result.put("currentPage", currentPage);
		System.out.println(result);
		return result;

	}

	// 게시판에 게시글 나타내기
	public List<BoardListDto> selectAllList(String memId) {
		List<BoardListDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession();

		result = dao.selectAllList(session, memId);

		session.close();
		return result;
	}

	public List<BoardReplyDto> selectBoardReplyList(Integer boardId) {
		List<BoardReplyDto> result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.selectBoardReplyList(session, boardId);

		session.close();
		return result;
	}

	// 게시글 상세 페이지 들어가서 보는 것
	public BoardContentDto selectOne(int boardId) {
		BoardContentDto result = null;
		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.selectOne(session, boardId);

		System.out.println("BoardContentService : " + boardId);

		session.close();

		return result;
	}

	// 게시글 추가
	public int insert(BoardInsertDto dto) {
		int result = 0;

		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.insert(session, dto);
		session.close();
		
		System.out.println("boardservice: " + result);
		return result;
	}

	// 댓글, 대댓글 작성 (여기서 나누기 - 각자 해당하는 dao로 이동)
	public int insertReplyWrite(BoardReplyDto replydto) {
		int result = 0;
		
		SqlSession session = MybatisTemplate.getSqlSession(false);
		//autocommit - false 시켜야 commit, rollback 의미있음
		
		if(replydto.getReplyId() == 0) {
			//댓글이 입력된 값을 가져가는 중이라서 아직 몇번째 댓글인지 모름
			
			result = dao.insertReplyWrite(session, replydto);
			//댓글
			
		} else {
			result = dao.insertReplyWriteAgain(session, replydto);
			//대댓글은 댓글Id를 들고와서 댓글Id 무조건 가지고있음
			// - 가지고 있어야 해당 댓글에 대댓글이 달릴 수 있음
		}

		if (result > 0) {
			session.commit();
			// 이러면 정상
		} else {
			session.rollback();
			// 여기는 비정상
		}

		session.close();
		System.out.println("댓글작성 service : " + result);

		return result;

	}

	// 게시글 수정
	public int update(BoardUpdateDto dto) {
		int result = 0;

		SqlSession session = MybatisTemplate.getSqlSession();
		result = dao.update(session, dto);

		session.close();
		return result;
	}

	
	//게시글 삭제
//	public int deleteBoard(Integer boardId) {
//		int result = 0;
//		SqlSession session = MybatisTemplate.getSqlSession();
//		
//		int replyCount = dao.selectReplyCount(session, boardId);
//
//		if(replyCount > 0) {
//		//  게시글에 댓글 달려있으면
//			result = dao.deleteBoardReplyAll(session, boardId);
//			if(result < 0) {
//				return result;
//				//댓글 지우다 오류 발생
//			}
//		}
//		result = dao.deleteBoard(session, boardId);
//		//위에서 댓글들 지웠으니 게시글 자체 지우기
//
//		session.close();
//		return result;
//	}
//	

	// 게시글 한 개 이상 삭제
	public int deleteBoards(List<Integer> boardIdList) {
		int result = 0;
		SqlSession session = MybatisTemplate.getSqlSession();
		
		for(Integer boardId : boardIdList ) {
			int replyCount = dao.selectReplyCount(session, boardId);
	
			if(replyCount > 0) {
			//  게시글에 댓글 달려있으면
				result = dao.deleteBoardReplyAll(session, boardId);
				if(result < 0) {
					return result;
					//댓글 지우다 오류 발생
				}
			}
			result = dao.deleteBoard(session, boardId);
			//위에서 댓글들 지웠으니 게시글 자체 지우기
		}
		session.close();
		return result;
	}
	
	
	// 댓글 삭제
	public Map<String, Object> deleteBoardReply(Map<String, String> paramMap) {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		SqlSession session = MybatisTemplate.getSqlSession(false);
		
		int checkMyReplyResult = dao.checkMyReply(session, paramMap);
		//나의 댓글만 지울수 있게 확인 여부 나타내기
		if(checkMyReplyResult < 1) {
			resultMap.put("deleteResult", -2);
			//나의 댓글이 아닌 경우 -2로 지정
		} else { 
			//나의 댓글이라면 그때부터 삭제 가능
			int result = dao.checkReplyLevel2(session, paramMap);
			if(result > 0) {
				resultMap.put("deleteResult", -1);
				//댓글에 대댓글이 달려있어서 삭제할 수 없는 상황인 경우 -1로 지정
			} else {
				result = dao.deleteBoardReply(session, paramMap);
				resultMap.put("deleteResult", result);
				if(result > 0) {
					List<BoardReplyDto> dtolist = dao.selectBoardReplyList(session, Integer.parseInt(paramMap.get("boardId")));
					//dao에서는 boardId가 integer형태라서 string 형태에서 int 형태로 바꾸기
					resultMap.put("dtolist", dtolist);
					//dtolist에 값이 들어있을수도 있고 없을 수도 있음(0이면 없고 -1, -2여도 오류라서 값이 들어있지 않음)
				}
			}
		}
		session.commit(); //위에 false라고 해서 이거 써줘야함
		session.close();
		return resultMap;
	}

	

}
