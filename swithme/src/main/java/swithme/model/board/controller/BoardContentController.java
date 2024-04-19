package swithme.model.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.board.service.BoardService;

/**
 * Servlet implementation class BoardContentController
 */
@WebServlet("/boardcontent")
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
		//태그에서 입력된 값을 string 형태로 request.getParameter에서 가져와서 boardIdStr 에 값 넣어줌
		
		
		try {
			int boardId = Integer.parseInt(boardIdStr);
			request.setAttribute("dto", service.selectOne(boardId));
			//dto(그냥 이름 지정)에 service.selectOne(boardId) 이 값 넘겨줌 => 자료형이 객체
			//게시글 하나 뽑아서 읽는 것
			
			System.out.println("controller : " + boardIdStr);
			
			request.getRequestDispatcher("/WEB-INF/views/board/boardcontent.jsp").forward(request, response);
			
		} catch (NumberFormatException e) {
			response.sendRedirect(request.getContextPath() + "/board");
		}
	}


}
