package swithme.model.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.board.dto.BoardListDto;
import swithme.model.board.service.BoardService;
import swithme.model.member.dto.MemberInfoDto;

@WebServlet("/mypage/myboard")
public class MemberBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
	
	

	public MemberBoardController() {
		super();

	}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		String memId = loginInfo.getMemId();
		List<BoardListDto> dto = service.selectAllList(memId);
		//BoardListDto 안에 있는 필드명 가져와서 쓰는 것
		
		request.setAttribute("boardlist", dto);
		
		request.getRequestDispatcher("/WEB-INF/views/member/myboard.jsp").forward(request, response);

	}

}
