package swithme.model.group.controller;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.group.dto.GroupDto;
import swithme.model.group.dto.GroupMylistDto;
import swithme.model.group.service.GroupService;
import swithme.model.member.dto.MemberInfoDto;

@WebServlet("/group")
public class GroupController extends HttpServlet implements Serializable{
	private static final long serialVersionUID = 1L;
	GroupService service = new GroupService();

    public GroupController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//전체 그룹
		List<GroupDto> OpenGrouplist = service.selectAllOpenList(1, 20);
		request.getSession().setAttribute("OpenGrouplist", OpenGrouplist);
		//추천 그룹
		List<GroupDto> RandGrouplist = service.selectRandList();
		request.getSession().setAttribute("RandGrouplist", RandGrouplist);
		
		request.getRequestDispatcher("/WEB-INF/views/group/grouphome.jsp").forward(request, response);
	}
}
