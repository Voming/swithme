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

@WebServlet("/group/join/check.ajax")
public class GroupJoinCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GroupService service = new GroupService();
  
    public GroupJoinCheckController() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		String memId = loginInfo.getMemId();
		
		String groupIdstr = request.getParameter("m_group_id");
		int groupId = Integer.parseInt(groupIdstr);
		
		//가입된 그룹인지 체크
		GroupMemberDto dto = new GroupMemberDto(groupId, memId);
		int result = service.selectJoinCheck(dto);
		
		response.getWriter().append(String.valueOf(result));
	}

}
