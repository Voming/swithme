package swithme.model.group.controller;

import java.io.IOException;
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

/**
 * Servlet implementation class GroupController
 */
@WebServlet("/group")
public class GroupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GroupService service = new GroupService();

    public GroupController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		if(loginInfo == null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		String memberId = loginInfo.getMemId();
		//내 그룹
		List<GroupMylistDto> myGrouplist = service.selectMyList(memberId);
		request.getSession().setAttribute("myGrouplist", myGrouplist);
		
		//전체 그룹
		List<GroupDto> OpenGrouplist = service.selectAllOpenList(1, 20);
		request.getSession().setAttribute("OpenGrouplist", OpenGrouplist);
		
		List<GroupDto> RandGrouplist = service.selectRandList();
		request.getSession().setAttribute("RandGrouplist", RandGrouplist);
		
		request.getRequestDispatcher("/WEB-INF/views/group/grouphome.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
