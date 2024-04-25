package swithme.model.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import swithme.model.board.dto.BoardReplyDto;
import swithme.model.board.service.BoardService;
import swithme.model.member.dto.MemberInfoDto;

/**
 * Servlet implementation class BoardReplyWriteController
 */
@WebServlet("/board/reply/write")
//LoginFilter 에서 urlPatterns에 url에 /board/라고 써진 모든 것들을 로그아웃 하기 전까지
// login 상태 유지시키겠다고 조건 걸어놔서 로그인 유지를 위해 게시글 관련된 url 은 앞에 /board/ 붙여주기
public class BoardReplyWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReplyWriteController() {
        super();

    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String replyAjaxSuccess = null;
		
		String replyIdStr = request.getParameter("replyId");
		int replyId = 0;
		String boardIdStr = request.getParameter("boardId");
		int boardId = 0;
			if(boardIdStr != null && !boardIdStr.equals("")) {
				try {
					boardId = Integer.parseInt(boardIdStr);
				}catch (NumberFormatException e) {
					response.getWriter().append("boardId 안들어옴");
					return;
				}
			}
		
		String replyContent = request.getParameter("replyContent");
		
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		String replyWriterid = loginInfo.getMemId();

		System.out.println("댓글아이디 : " + replyWriterid);
		System.out.println("댓글 내용 : " + replyContent);


		if(replyIdStr != null && !replyIdStr.equals("")) {
			try {
				replyId = Integer.parseInt(replyIdStr);
			} catch (NumberFormatException e) {
				response.getWriter().append("replyId 안들어옴");
				return;
			}
		}
		
		if(replyIdStr == null || replyIdStr.equals("")) {
			//아무것도 안써있으면 댓글 원본으로 간주함
			replyId = 0;
		}
		//dto에서 받은 값 jsp로 전달
		
		String replyRefStr = request.getParameter("replyRef");
		String replyStepStr = request.getParameter("replyStep");
		String replyLevelStr = request.getParameter("replyLevel");
		int replyRef = 0;
		int replyStep = 0;
		int replyLevel = 0;
		
		if(replyRefStr!= null && replyStepStr!= null && replyLevelStr!= null) {
			try {
				replyRef = Integer.parseInt(replyRefStr);
				replyStep = Integer.parseInt(replyStepStr);
				replyLevel = Integer.parseInt(replyLevelStr);
				
			} catch (NumberFormatException e) {
				response.getWriter().append("replyId 안들어옴");
				return;
			}
		}
		
		
		System.out.println("댓글 순서 : " + replyRef + " " + replyStep + " " +replyLevel);
		
		//댓글, 대댓글 달기
		BoardReplyDto replydto = new BoardReplyDto(replyId, boardId, replyWriterid, replyContent, "", replyRef, replyStep, replyLevel);
		//writeTime은 query문 자체에 default 로 들어가서 null로 써줘도 상관없음(자리채우는 느낌) 
		System.out.println(replydto);
		
		 int result = service.insertReplyWrite(replydto);
		 System.out.println( "댓글 달기 : " + result);
		 
		 if(result>0) {
			 //db에서 갔다 올때 insert값이랑 select값(댓글 등록된 값) jsp로 전달 
			 //-> return AJAX  SUCCESS로 전달함 
			 List<BoardReplyDto> replyList = service.selectBoardReplyList(boardId);
			 Gson gson = new Gson();
			 replyAjaxSuccess = gson.toJson(replyList);
			 System.out.println("replyList : " + replyAjaxSuccess);
		 } else {
			 //0보다 작아도 INSERT 실패 success 로 가는데 무슨 값을 전달할것인가? null
			 replyAjaxSuccess = null;
		 }	 
		 response.getWriter().append(replyAjaxSuccess);
		 


		 
		 
	}
}
