package swithme.model.board.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import swithme.model.board.service.BoardService;
import swithme.model.member.dto.MemberInfoDto;

@WebServlet("/board/reply/delete")
public class BoardReplyDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
	
    public BoardReplyDeleteController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String replyId = request.getParameter("replyId");
		String boardId = request.getParameter("boardId");
		//int 대신 string 으로 써도 되는 이유 - db에서 이거 커버해줌
		// ex. select * from board where board_id = '2'; 이렇게 써도 2번째 게시글 선택해줘서
		//	(문자열 형태는 '' 이거 안에 쓰고 숫자는 '' 없이 쓰잖아~
		
		String memId = ((MemberInfoDto)request.getSession().getAttribute("loginInfo")).getMemId();
		//이거 줄여서 쓴건데 모르면 다른거 참고해서 보기
		
		Map<String, String> paramMap = new HashMap<String, String>();
		//map 형태로 service로 보내기
		paramMap.put("boardId", boardId);
		paramMap.put("replyId", replyId);
		paramMap.put("memId", memId);
		Map<String, Object> resultMap = service.deleteBoardReply(paramMap);
		//service에서 보내고 mapper, dto까지 간 다음에 다시 돌아와서 deleteBoardReply에 값 넣고 
		//그 값을 resultMap에 넣어주기
		
		response.getWriter().append(new Gson().toJson(resultMap));
	}

}
