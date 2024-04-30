package swithme.model.member.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import swithme.model.board.service.BoardService;

@WebServlet("/mypage/myboard/delete")
public class MemberBoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    BoardService service = new BoardService() ;  
    
    public MemberBoardDeleteController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ajax에서 list형태를 가져와서 service를 거쳐 쭉 거친다음 dto에 값넣어서 밑에 result 안에 넣고 다시 jsp로 보냄
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		Integer[] dto = gson.fromJson(request.getReader(), Integer[].class);
		List<Integer> boardIdList = Arrays.asList(dto);
		System.out.println(boardIdList);
		
		int result = service.deleteBoards(boardIdList);
		
		response.getWriter().append(String.valueOf(result));
		//string 형태로 ajax로 보냄
	}
}
