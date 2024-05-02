package swithme.model.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.member.dto.MemberInfoDto;
import swithme.model.member.dto.MemberUpdateDto;
import swithme.model.member.service.MemberService;




/**
 * Servlet implementation class PwdChangeController
 */
@WebServlet("/update")
public class PwdUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberService service=new MemberService();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PwdUpdateController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/member/pwdupdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo"); 
			String memId = loginInfo.getMemId();
			String memPwd = loginInfo.getMemPwd();
			String pwd = request.getParameter("pwd");
			String newpwd=request.getParameter("newpwd");
			String newpwd2=request.getParameter("newpwd2");
			
			System.out.println("memId>>>>  "+memId);
			System.out.println("memPwd++++++  "+memPwd);
			System.out.println("pwd>>>>>  "+pwd);
			System.out.println("newpwd++++++  "+newpwd);
			
			
			MemberUpdateDto dto= new MemberUpdateDto(memId,memPwd,newpwd);
			int result=service.update(dto);
			
			
			if(newpwd.equals(newpwd2)) {
				result=1;
			}else {
				result=0;
			}
			response.getWriter().append(String.valueOf(result));
	}

}
