package swithme.model.board.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import swithme.model.board.dto.BoardReplyListDto;
import swithme.model.board.dto.BoardReplyWriteDto;
import swithme.model.board.service.BoardService;
import swithme.model.member.dto.MemberInfoDto;

/**
 * Servlet implementation class BoardReplyWriteController
 */
@WebServlet("/replywrite")
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
		String replyIdStr = request.getParameter("replyid");
		int replyId = 0;
		String boardIdStr = request.getParameter("boardId");
		int boardId = 0;
		String replyContent = request.getParameter("replyContent");
		
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		if(loginInfo == null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		String replyWriterid = loginInfo.getMemId();

		Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String replyWritetime = format.format(date);

		Gson gson = new Gson();
		
		if(boardIdStr == null || boardIdStr.equals("")) {
			response.getWriter().append("-1");
			//담아주는 모양 json 형태로 넘겨야함
			//read.jsp 의 ajax로 넘어감
			
			return;
			//boardIdStr 없으면 이 밑에 if문은 실행할 필요X
		}
		
		if(boardIdStr != null && !boardIdStr.equals("")) {
			try {
				boardId = Integer.parseInt(boardIdStr);
			}catch (NumberFormatException e) {
				response.getWriter().append("-1");
				return;
			}
		}
		
		if(replyIdStr != null && !replyIdStr.equals("")) {
			try {
				replyId = Integer.parseInt(replyIdStr);
				
			} catch (NumberFormatException e) {
				response.getWriter().append("-1");
				return;
			}
		}
		
		if(replyIdStr == null || replyIdStr.equals("")) {
			//아무것도 안써있으면 댓글 원본으로 간주함
			replyId = 0;
		}
		
		//dto에서 받은 값 jsp로 전달

		 BoardReplyWriteDto dto = new BoardReplyWriteDto(replyId, boardId, replyContent, replyWriterid, replyWritetime);
		 
		 int result = service.insertReplyWrite(dto); 
		 if(result > 0) {
			 List<BoardReplyListDto> replydtolist = service.selectBoardReplyList(boardId);
			 response.getWriter().append(gson.toJson(replydtolist)); 
		 }

	}

}
