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
import swithme.model.member.dto.MemberBoardDto;

@WebServlet("/mypage/myboard/delete")
public class MemberBoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    BoardService service = new BoardService() ;  
    
    public MemberBoardDeleteController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ajax에서 list형태를 보내는 방법
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		MemberBoardDto[] dto = gson.fromJson(request.getReader(), MemberBoardDto[].class);
		List<MemberBoardDto> dtoList = Arrays.asList(dto);
		System.out.println(dtoList);
		
		int result = 0;
		for(int i = 0; i<dtoList.size(); i++) {
			result = service.deleteBoard(dtoList.get(i).getBoardId());
			if(result < 0) {
				//삭제가 되지 않음
			}
		}
		
		response.getWriter().append(String.valueOf(result));
		//string 형태로 ajax로 보냄
	}
}
