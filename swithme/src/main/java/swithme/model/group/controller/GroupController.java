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
 * Servlet implementation class GroupController
 */
@WebServlet("/group")
public class GroupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GroupService service = new GroupService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<GroupDto> grouplist = service.selectAllList();
		System.out.println(grouplist);
		request.getSession().setAttribute("grouplist", grouplist);

		request.getRequestDispatcher("/WEB-INF/views/group/grouphome.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
