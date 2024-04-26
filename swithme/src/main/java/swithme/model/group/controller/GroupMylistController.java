package swithme.model.group.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import swithme.model.group.dto.GroupMylistDto;
import swithme.model.group.service.GroupService;
import swithme.model.member.dto.MemberInfoDto;

/**
 * Servlet implementation class GroupMylistController
 */
@WebServlet("/group/mylist.ajax")
public class GroupMylistController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GroupService service = new GroupService();
	   
    public GroupMylistController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		String memberId = loginInfo.getMemId();
		//내 그룹
		List<GroupMylistDto> myGrouplist = service.selectMyList(memberId);
	
		Gson gson = new Gson();
		response.getWriter().append(gson.toJson(myGrouplist));
	}

}
