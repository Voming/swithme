package swithme.model.group.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import swithme.model.group.dto.GroupDto;
import swithme.model.group.service.GroupService;

@WebServlet("/group/more.ajax")
public class GroupMoreListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GroupService service = new GroupService();

	public GroupMoreListController() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String more = request.getParameter("more");
		int moreCnt = (Integer.parseInt(more) + 2) * 4; //더보기 눌렀을때 늘어나는 값
		
		List<GroupDto> MoreGrouplist = service.selectAllOpenList(1, moreCnt);
		
		Gson gson = new Gson();
		response.getWriter().append(gson.toJson(MoreGrouplist));
	}

}
