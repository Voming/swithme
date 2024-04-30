package swithme.model.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import swithme.model.board.service.BoardService;
import swithme.model.member.dto.MemberInfoDto;

@WebServlet("/mypage/myboard")
public class MemberBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();
	int currentPage = 1; // 기본적으로 들어왔을때는 첫번째 페이지로 들어오게끔 함

	public MemberBoardController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageNum = request.getParameter("page");
//		1. 앞에서 string 값을 받아와서(페이지가 일단 값이 string으로 옴
		if (pageNum != null && !pageNum.equals("")) {
			try {
				currentPage = Integer.parseInt(pageNum);
				// 2. string 을 int로 바꿔주고
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		
		request.getRequestDispatcher("/WEB-INF/views/member/myboard.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한 페이지 당 나오는 게시글 수
		
		int boardNum = 15;

		// 화면 하단에 나타날 페이지 수 = 3개(1, 2, 3)
		int boardPageNum = 3;

		// 현재 페이지 알아야함(어떻게 기준으로 삼을지..)

		// client 가 페이지 지정하고 들어온게 있다면 그것에 맞게 현재페이지 바껴야함

		MemberInfoDto loginInfo = (MemberInfoDto) request.getSession().getAttribute("loginInfo");
		String memId = loginInfo.getMemId();

		// loginInfo 에서 memId만 뽑음
		Map<String, Object> result = service.selectPage(boardNum, boardPageNum, currentPage, memId);
		// service.selectPage(boardNum, boardPageNum, currentPage, memId) 이 db로 갔다가 다시
		// 와서 result 에 담음
		// 위에 memId = loginInfo.getMemId(); 때문에 memId에 값이 들어가서 mapper에서 if의 조건식에 충족에 되서
		// if안에 있는 sql까지 활용

		Gson gson = new Gson();
		System.out.println(result);
		response.getWriter().append(gson.toJson(result));
	}

}
