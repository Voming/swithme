package swithme.model.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.member.dto.MemberInfoDto;
import swithme.model.member.service.MemberService;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/out")
public class OutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OutController() {
        super();
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/out dopost");
		
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		String memId = loginInfo.getMemId();
		System.out.println("++++++"+memId);
		
		int result=new MemberService().delete(memId);
		//MemberService service= new MemberService();
		//service.delete(memId);
		if(result >0) {
			request.getSession().removeAttribute("loginInfo");
		}
		
		
		
		response.sendRedirect(request.getContextPath()+"/welcome");
	}

}
