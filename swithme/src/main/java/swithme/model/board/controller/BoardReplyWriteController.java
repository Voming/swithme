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
		String returnToAjaxSuccess = null;
		
		String replyIdStr = request.getParameter("replyId");
		int replyId = 0;
		String boardIdStr = request.getParameter("boardId");
		int boardId = 0;
		String replyContent = request.getParameter("replyContent");
		
		
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		//getAttribute에서 loginInfo 값을 가져옴 -> MemberInfoDto에서 가져옴
		//(MemberInfoDto) 를 붙인 이유는 이 형태로 변환하기 위해서
		if(loginInfo == null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		
		String replyWriterid = loginInfo.getMemId();

		System.out.println("댓글아이디 : " + replyWriterid);
		System.out.println("댓글 내용 : " + replyContent);
		
		if(boardIdStr != null && !boardIdStr.equals("")) {
			try {
				boardId = Integer.parseInt(boardIdStr);
			}catch (NumberFormatException e) {
				response.getWriter().append("boardId 안들어옴");
				return;
			}
		}
		
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
		
		
		BoardReplyDto replydto = new BoardReplyDto(replyId, boardId, replyWriterid, replyContent, "", replyRef, replyStep, replyLevel);
		//writeTime은 query문 자체에 default 로 들어가서 null로 써줘도 상관없음(자리채우는 느낌) 
		System.out.println(replydto);
		
		 int result = service.insertReplyWrite(replydto);
		 System.out.println( "result" + result);
		 
		 if(result>0) {
			 //db에서 갔다 올때 insert값이랑 select값(댓글 등록된 값) jsp로 전달 
			 //-> return AJAX  SUCCESS로 전달함 
			 List<BoardReplyDto> replyList = service.selectBoardReplyList(boardId);
			 Gson gson = new Gson();
			 returnToAjaxSuccess = gson.toJson(replyList);
			 System.out.println("replyList" + returnToAjaxSuccess);
		 } else {
			 //0보다 작아도 INSERT 실패 success 로 가는데 무슨 값을 전달할것인가? null
			 returnToAjaxSuccess = null;
		 }	 
		 response.getWriter().append(returnToAjaxSuccess);
	}
}
