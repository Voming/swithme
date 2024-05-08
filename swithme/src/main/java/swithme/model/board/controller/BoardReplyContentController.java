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

@WebServlet("/board/reply/content")
public class BoardReplyContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();

    public BoardReplyContentController() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("loadedHandler 안에 있는 ajax에서 댓글, 대댓글 정보 받아오기");
		String boardIdStr = request.getParameter("id");
		//url 에서 id 값을 꺼냄 => http://127.0.0.1:8080/swithme/board/content?id=1 
		
		try {
			int boardId = Integer.parseInt(boardIdStr);
			List<BoardReplyDto> replydtolist = service.selectBoardReplyList(boardId); //댓글들 읽기
			System.out.println(replydtolist);
			
			request.setAttribute("replyList", replydtolist);
			response.getWriter().append(new Gson().toJson(replydtolist));
		
		} catch (NumberFormatException e) {
			System.out.println("!!! NumberFormatException !!!!!!");
			response.getWriter().append(new Gson().toJson(null));
		}
		
	}

}
