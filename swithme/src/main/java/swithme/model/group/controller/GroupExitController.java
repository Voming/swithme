package swithme.model.group.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.group.dto.GroupMemberDto;
import swithme.model.group.service.GroupService;
import swithme.model.member.dto.MemberInfoDto;

/**
 * Servlet implementation class GroupExitController
 */
@WebServlet("/group/exit.ajax")
public class GroupExitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GroupService service = new GroupService();
   
    public GroupExitController() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		String memberId = loginInfo.getMemId();
		
		String groupIdstr = request.getParameter("groupId");
		int groupId = 0;
		try {
			groupId = Integer.parseInt(groupIdstr);
		}catch (NumberFormatException e) {
			response.getWriter().append("-1");
			return;
		}
		
		GroupMemberDto dto = new GroupMemberDto(groupId, memberId);
		int result = 0;
		
		//그룹에 마지막으로 남은 사용자가 그룹 탈퇴시 그룹 삭제됨
		int  memCount = service.selectMemCount(groupId);
		if(memCount > 1) {
			result = service.deletMemberGroup(dto);
			System.out.println(dto);
			//그룹 유지
		} else {
			service.deletMemberGroup(dto);
			System.out.println(dto);
			//그룹 삭제
			result = service.deleteGroup(groupId);
		}
		
		
		
		response.getWriter().append(String.valueOf(result));
	}

}
