package swithme.model.group.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import swithme.model.group.dto.GroupDto;
import swithme.model.group.service.GroupService;

/**
 * Servlet implementation class GroupFindController
 */
@WebServlet("/group/find.ajax")
public class GroupFindController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	GroupService service = new GroupService();
   
    public GroupFindController() {
        super();
      
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String findstr = request.getParameter("find");
		System.out.println(findstr);
		
		//그룹 검색하기
		List<GroupDto> findGrouplist = service.selectFindList(findstr);
		//request.getSession().setAttribute("findGrouplist", findGrouplist);
		Gson gson = new Gson();
		System.out.println(gson.toJson(findGrouplist));
		response.getWriter().append(gson.toJson(findGrouplist));
	}

}
