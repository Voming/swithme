package swithme.model.myrecord.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.myrecord.dto.SubjectAddDto;
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
		System.out.println(">>>>>>>>>>>>>>>>>>>>>> /addsubject.ajax");
		
		String subName= request.getParameter("subName");
		String selectColor= request.getParameter("selectColor");
		//TODO memId
		String memId= "won";
		SubjectAddDto dto = new SubjectAddDto( memId, subName, selectColor);
		
		int result = service.insert(dto);
		request.getRequestDispatcher("/WEB-INF/views/myrecord/myrecord.jsp").forward(request, response);
		
	}

}
