package swithme.model.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.member.service.MemberService;


/**
 * Servlet implementation class CheckIdController
 */
@WebServlet("/checkid")
public class CheckIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckIdController() {
        super();
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("###checkid 진입");
		String memId=request.getParameter("swithid");
		
		int result = new MemberService().selectCheckId(memId);
		response.getWriter().append(String.valueOf(result));
		System.out.println(result);
	}

}
