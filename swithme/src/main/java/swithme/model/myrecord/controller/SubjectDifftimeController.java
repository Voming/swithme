package swithme.model.myrecord.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.myrecord.dto.SubjectDifftimeDto;
import swithme.model.myrecord.service.RecordService;

/**
 * Servlet implementation class MyrecodController
 */
@WebServlet("/myrecord")
public class SubjectDifftimeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RecordService service = new RecordService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectDifftimeController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String subjectName = request.getParameter("subjectName");
		System.out.println(">>>>>>>>myrecordController : ");
		//TODO memId 고정됨
		String memId = "won";
		
		List<SubjectDifftimeDto>sublist = service.SubjectDifftime(memId);
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
