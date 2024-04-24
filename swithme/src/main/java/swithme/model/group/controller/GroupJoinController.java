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

@WebServlet("/group/join.ajax")
public class GroupJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GroupService service = new GroupService();
	
    public GroupJoinController() {
        super();
      
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/group/join.ajax post");
		
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		if(loginInfo == null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return;
		}
		String memId = loginInfo.getMemId();
		
		String groupIdstr = request.getParameter("m_group_id");
		String pwdstr = request.getParameter("m_pwd");
		
		int result = 0;
		
		int groupId = Integer.parseInt(groupIdstr);
	
		// 그룹 가입
		String rPwd = service.selectJoinPwd(groupId); //실제 비밀번호 체크
		
		if(pwdstr.equals(rPwd)) { //비밀번호 일치하면 가입
			GroupMemberDto dto = new GroupMemberDto(groupId, memId);
			//int inResult = service.(groupId, memId);
		}
		
		response.getWriter().append(String.valueOf(result));
	}

}
