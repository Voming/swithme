package swithme.model.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.board.dto.BoardInsertDto;
import swithme.model.board.service.BoardService;
import swithme.model.member.dto.MemberInfoDto;

/**
 * Servlet implementation class BoardWriteController
 */
@WebServlet("/boardwrite")
public class BoardWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteController() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String backPage = (String) request.getSession().getAttribute("backPage");
		if(backPage != null && backPage.equals("write")) {
			request.getSession().removeAttribute("backPage");
		}
		
		request.getRequestDispatcher("/WEB-INF/views/board/boardwrite.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//jsp에서 여기로 전달
		String title = request.getParameter("title"); // form 태그 안에 있는 name 따라감
		String content = request.getParameter("content");
		
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		if(loginInfo == null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		String boardWriter = loginInfo.getMemId();
		
		BoardInsertDto dto = new BoardInsertDto(boardWriter, title, content); 
		//jsp에서 쓴 내용을 dto에 담아서 service로 가지고 가는것
		
		int result = service.insert(dto); 
		//오른쪽: dto를 가지고 service의 insert 함수로 가는 것
		//왼쪽: service 에서 결과 가지고 온것을 result 에 담음
		//넣으면 return 값이 나와용
		
		response.sendRedirect(request.getContextPath() + "/board"); //페이지 전환
		
	}

	//result 를 controller에서 jsp 로 보낼때 request.getWriter().append(result); - ajax 에서만 가능
	//int 는 전달안되서 string 형태만 전달 됨
}
