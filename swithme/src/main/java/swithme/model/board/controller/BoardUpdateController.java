package swithme.model.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.board.dto.BoardInsertDto;
import swithme.model.board.dto.BoardUpdateDto;
import swithme.model.board.service.BoardService;
import swithme.model.member.dto.MemberInfoDto;

/**
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/board/update")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글을 보여줘
		
		String boardIdStr = request.getParameter("id"); //getParameter return type이 string
		//사용자 입력값이 다 string 형태로 인식되서 먼저 string 형태에 넣어준 다음에 밑에서 형변환 하기
		//url에서 넘어온 id 정보를 가지고 그것에 해당하는 정보를 jsp 화면에 뿌려줌
		
		try {
			int boardId = Integer.parseInt(boardIdStr);
			request.setAttribute("dto", service.selectOne(boardId));
			//dto(그냥 이름 지정)에 service.selectOne(boardId) 이 값 넘겨줌 => 자료형이 객체
			//게시글 하나 뽑아서 읽는 것
			request.getRequestDispatcher("/WEB-INF/views/board/boardupdate.jsp").forward(request, response);

		}catch(NumberFormatException e) {
			System.out.println("!!! NumberFormatException !!!!!!");
			response.sendRedirect(request.getContextPath()+"board");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글을 수정해줘
		
		String title = request.getParameter("title"); // form 태그 안에 있는 name 따라감
		String content = request.getParameter("content");
		String writer =  request.getParameter("writer");
		String boardIdStr = request.getParameter("boardId");

			System.out.println("게시글 수정 : " + title + " " + content);

			try {
				int boardId = Integer.parseInt(boardIdStr);

				MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
				String boardWriter = loginInfo.getMemId();
				
				BoardUpdateDto dto = new BoardUpdateDto(boardId, boardWriter, title, content); 
				int result = service.update(dto);
				
				response.sendRedirect(request.getContextPath() + "/board/content?id=" + boardId);
				
			} catch (NumberFormatException e) {
				System.out.println("NUMBERFORMATEXCEPTION");
			}
			
				
			
	}
}
