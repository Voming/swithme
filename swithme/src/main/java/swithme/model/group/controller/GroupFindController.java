package swithme.model.group.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.group.dto.GroupDto;
import swithme.model.group.service.GroupService;

/**
 * Servlet implementation class GroupFindController
 */
@WebServlet("/group/find")
public class GroupFindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GroupService service = new GroupService();
   
    public GroupFindController() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String findstr = request.getParameter("find");
		System.out.println(findstr);
		request.getSession().setAttribute("findstr", findstr);
		
		//그룹 검색하기
		List<GroupDto> findGrouplist = service.selectFindList(findstr);
		request.getSession().setAttribute("findGrouplist", findGrouplist);
	
		
		request.getRequestDispatcher("/WEB-INF/views/group/groupfind.jsp").forward(request, response);
		
	}

}
