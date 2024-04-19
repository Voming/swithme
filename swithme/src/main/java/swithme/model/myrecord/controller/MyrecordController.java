package swithme.model.myrecord.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.member.dto.MemberInfoDto;
import swithme.model.myrecord.dto.SubjectDifftimeDto;
import swithme.model.myrecord.service.RecordService;

/**
 * Servlet implementation class MyrecordController
 */
@WebServlet("/myrecord")
public class MyrecordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RecordService service = new RecordService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyrecordController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String subjectName = request.getParameter("subjectName");
				//TODO memId 고정됨
				// memId
				MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
				System.out.println(">>>>>>>>myrecordController : "+loginInfo);
//				if(loginInfo == null) {
//					request.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(request, response);
//				}
//				String memId = loginInfo.getMemId();
				String memId = null;
				if (loginInfo != null) {
					memId = loginInfo.getMemId();
				}
				System.out.println(">>>>>>>>>>>>>>>>>>>>>> DIFFFCONTROLERE MEMID  " + memId);
				
				
				
				List<SubjectDifftimeDto> sublist = service.subjectDifftime(memId);
				request.setAttribute("sublist", sublist);
				
				System.out.println(">>>>>>>>result : "+sublist);
				request.getRequestDispatcher("/WEB-INF/views/myrecord/myrecord.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
