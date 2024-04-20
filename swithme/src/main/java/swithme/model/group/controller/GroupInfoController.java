package swithme.model.group.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.group.dto.GroupInfoDto;
import swithme.model.group.dto.GroupRecordSumDto;
import swithme.model.group.service.GroupService;

/**
 * Servlet implementation class GroupInfoController
 */
@WebServlet("/group/info")
public class GroupInfoController extends HttpServlet {
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
		GroupInfoDto groupInfo = service.selectGroupInfo(groupId);
		
		System.out.println("groupId : "+ groupId);
		request.getSession().setAttribute("groupInfo", groupInfo);
		
		List<GroupRecordSumDto> groupSumList = service.selectGroupRecordSumList(groupId);
		request.getSession().setAttribute("groupSumList", groupSumList);
		System.out.println("groupSumList : " + groupSumList);
		
		int groupSum = service.test("song");
		System.out.println("groupSum" + groupSum);
		
		request.getRequestDispatcher("/WEB-INF/views/group/groupinfo.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
