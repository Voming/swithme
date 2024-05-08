package swithme.model.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import swithme.model.board.service.BoardService;

@WebServlet("/board")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();

    public BoardListController() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//setAttribute를 통해서 boardlistdto 라는 이름에 service에서 selectAllList()를 통해 값을 불러와서 넣어줌
		
		
		//한 페이지 당 나오는 게시글 수
		int boardNum = 15;
		
		//화면 하단에 나타날 페이지 수 = 3개(1, 2, 3)
		int boardPageNum= 3;
		
		//현재 페이지 알아야함(어떻게 기준으로 삼을지..)
		int currentPage = 1; //기본적으로 들어왔을때는 첫번째 페이지로 들어오게끔 함
		//client 가 페이지 지정하고 들어온게 있다면 그것에 맞게 현재페이지 바껴야함
		
		String pageNum = request.getParameter("page");
//		1. 앞에서 string 값을 받아와서(페이지가 일단 값이 string으로 옴 => url 통해 들어옴
		if(pageNum != null && !pageNum.equals("")) {
			
			try {
				currentPage = Integer.parseInt(pageNum);
				// 2. string 을 int로 바꿔주고
			} catch (NumberFormatException e) {
			}
			
		}
		String memId = null;
		//memId 를 null로 설정해서 밑에 memId 는 null로 가서 mapper의 if문을 활용 안함
		request.setAttribute("mapboardlist", service.selectPage(boardNum, boardPageNum, currentPage, memId));
		// 3. 여기서 다시 jsp로 값을 내보냄(int형으로 내보냄 - 페이지 숫자가 보임) 
		request.getRequestDispatcher("/WEB-INF/views/board/board.jsp").forward(request, response);

	
	}

}
