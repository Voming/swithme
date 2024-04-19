package swithme.model.myrecord.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.member.dto.MemberInfoDto;
import swithme.model.myrecord.dto.SubjectAddDto;
import swithme.model.myrecord.dto.SubjectDifftimeDto;
import swithme.model.myrecord.service.SubjectService;

/**
 * Servlet implementation class AddSubjectController
 */
@WebServlet("/addsubject")
public class AddSubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SubjectService service = new SubjectService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSubjectController() {
        super();    
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>> /addsubject.ajax 는 TODO");
		
		String subName= request.getParameter("subName");
		String selectColor= request.getParameter("selectColor");
		
		// memId
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		String memId = loginInfo.getMemId();
		System.out.println(">>>>>>>>>>>>>>>>>>>>>> /addsubject.ajax 는 MEMID  " + memId);
		
		
		
		SubjectAddDto dto = new SubjectAddDto( memId, subName, selectColor);
		
		List<SubjectDifftimeDto> sublist = service.insertSubjectAndSelectRecord(dto);
		request.setAttribute("sublist", sublist);
		request.getRequestDispatcher("/WEB-INF/views/myrecord/myrecord.jsp").forward(request, response);
		
	}

}
