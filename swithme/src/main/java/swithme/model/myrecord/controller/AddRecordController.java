package swithme.model.myrecord.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.myrecord.dto.SubjectAddDto;
import swithme.model.myrecord.dto.SubjectDifftimeDto;

/**
 * Servlet implementation class AddRecordController
 */
@WebServlet("/addrecord.ajax")
public class AddRecordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRecordController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>>>>>>>>>>>>>>>>>>>>> /addsubject.ajax memI와 recordSubjectId는 TODO");
		
		String startTime= request.getParameter("startTime");
		String endTime= request.getParameter("endTime");
		System.out.println(">>>>>>>>>>>>>>>>>>>>>> /addsubject.ajax start : "+startTime);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>> /addsubject.ajax start : "+endTime);
		//TODO memId
		String memId= "won";
		
		
//		SubjectAddDto dto = new SubjectAddDto( memId, subName, selectColor);
//		
//		List<SubjectDifftimeDto> sublist = service.insertSubjectAndSelectRecord(dto);
		//request.setAttribute("sublist", sublist);
		request.getRequestDispatcher("/WEB-INF/views/myrecord/myrecord.jsp").forward(request, response);
		
	}

}
