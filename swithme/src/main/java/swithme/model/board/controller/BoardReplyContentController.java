package swithme.model.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import swithme.model.board.service.BoardService;

/**
 * Servlet implementation class BoardReplyContentController
 */
@WebServlet("/replycontent")
public class BoardReplyContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReplyContentController() {
        super();
        
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardIdStr = request.getParameter("boardId");
		
		try {
			int boardId = Integer.parseInt(boardIdStr);
			response.getWriter().append(new Gson().toJson(service.selectBoardReplyList(boardId)));

			}catch(NumberFormatException e) {
				System.out.println("!!! NumberFormatException !!!!!!");
				response.sendRedirect(request.getContextPath()+"board");
		}
	}

}
