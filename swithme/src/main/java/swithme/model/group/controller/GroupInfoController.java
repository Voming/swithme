package swithme.model.group.controller;

import java.io.IOException;
import java.io.Serializable;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.group.dto.GroupDto;
import swithme.model.group.dto.GroupRecordDaySumDto;
import swithme.model.group.dto.GroupRecordSumDto;
import swithme.model.group.service.GroupService;

@WebServlet("/group/info")
public class GroupInfoController extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;
	GroupService service = new GroupService();
	
    public GroupInfoController() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String groupIdstr = request.getParameter("groupId");
		int groupId = 0;
		try {
			groupId = Integer.parseInt(groupIdstr);
		}catch (NumberFormatException e) {
			response.getWriter().append("-1");
			return;
		}
		GroupDto groupInfo = service.selectGroupInfoOne(groupId);
		
		System.out.println("groupId : "+ groupId);
		request.getSession().setAttribute("groupInfo", groupInfo);
	
		List<GroupRecordSumDto> groupSumList = service.selectGroupRecordSumList(groupId);
		request.getSession().setAttribute("groupSumList", groupSumList);
		System.out.println("groupSumList : " + groupSumList);
		
				
		List<GroupRecordDaySumDto> groupSumDayList = service.selectGroupRecordDaySumList(groupId);
		request.getSession().setAttribute("groupSumDayList", groupSumDayList);
		System.out.println(groupSumDayList);

		request.getRequestDispatcher("/WEB-INF/views/group/groupinfo.jsp").forward(request, response);
	}
}
