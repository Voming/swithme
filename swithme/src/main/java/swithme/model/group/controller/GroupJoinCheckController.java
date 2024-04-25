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
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/group/join/chehck.ajax");
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		String memId = loginInfo.getMemId();
		
		String groupIdstr = request.getParameter("m_group_id");
		int groupId = Integer.parseInt(groupIdstr);
		
		GroupMemberDto dto = new GroupMemberDto(groupId, memId);
		System.out.println("dto : " + dto);
		int result = service.selectJoinCheck(dto);
		System.out.println(result);
		
		response.getWriter().append(String.valueOf(result));
	}

}
