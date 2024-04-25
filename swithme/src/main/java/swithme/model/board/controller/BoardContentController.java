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

/**
 * Servlet implementation class BoardContentController
 */
@WebServlet("/board/content")
public class BoardContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardContentController() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/**
	 *
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardIdStr = request.getParameter("id");
		//getParameters는 return type이 string이라서 사용자 입력값이 다 string 형태로 인식
		//=> string 형태에 넣어준 다음에 밑에서 형변환 하기
		//request.getParameter에서 가져온 id값은 게시글 하나를 누르면 url 에 boardId 뒤에 뜨는 값 가져오게 되는 것
		
		try {
			int boardId = Integer.parseInt(boardIdStr);
			request.setAttribute("dto", service.selectOne(boardId));
			//dto(그냥 이름 지정)에 service.selectOne(boardId) 이 값 넘겨줌 => 자료형이 객체
			//게시글 하나 뽑아서 읽는 것
			//boardId 를 주고 값을 요청하는것(boardId를 안쓰면 몇번글을 가져오라는건데 라면서 오류뜸 - 매개변수로 넣어줌)
			
			System.out.println("controller : " + boardIdStr);
			
//			//댓글꺼까지 여기 있음
//			request.setAttribute("replydtolist", service.selectBoardReplyList(boardId));
//			System.out.println("replycontroller :" + service.selectBoardReplyList(boardId).toString());
			
			request.getRequestDispatcher("/WEB-INF/views/board/boardcontent.jsp").forward(request, response);
			
		} catch (NumberFormatException e) {
			System.out.println("!!! NumberFormatException !!!!!!");
			/* response.sendRedirect(request.getContextPath()+"/boardcontent"); */
			
		}
	}

	// ajax
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/board/content doPost - ajax로 reply list 읽어오기");
	}
}
