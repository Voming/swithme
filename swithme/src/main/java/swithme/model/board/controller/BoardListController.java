package swithme.model.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.board.service.BoardService;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/board")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListController() {
        super();
     
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("boardlistdto", service.selectAllList());
		
		//한 페이지 당 나오는 게시글 수
		int boardNum = 15;
		
		//화면 하단에 나타날 페이지 수 = 3개(1, 2, 3)
		int boardPageNum= 3;
		
		//현재 페이지 알아야함(어떻게 기준으로 삼을지..)
		int currentPage = 1; //기본적으로 들어왔을때는 첫번째 페이지로 들어오게끔 함
		//client 가 페이지 지정하고 들어온게 있다면 그것에 맞게 현재페이지 바껴야함
		
		String pageNum = request.getParameter("page");
		if(pageNum != null && !pageNum.equals("")) {
			
			try {
				currentPage = Integer.parseInt(pageNum);
			} catch (NumberFormatException e) {
			}
			
		}
		request.setAttribute("mapboardlist", service.selectPage(boardNum, boardPageNum, currentPage));
		request.getRequestDispatcher("/WEB-INF/views/board/board.jsp").forward(request, response);
		
		
	
	}

}
