package swithme.model.myrecord.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.member.dto.MemberInfoDto;
import swithme.model.myrecord.dto.SubjectAddDto;
import swithme.model.myrecord.service.SubjectService;

@WebServlet("/addsubject")
public class AddSubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SubjectService service = new SubjectService();
       
    public AddSubjectController() {
        super();    
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String subName= request.getParameter("subName");
		String selectColor= request.getParameter("selectColor");
		
		// memId
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		String memId = loginInfo.getMemId();
		
		SubjectAddDto dto = new SubjectAddDto( memId, subName, selectColor);
		
		// ajax
//		List<SubjectDifftimeDto> sublist = service.insertSubjectAndSelectRecord(dto);
//		to Json getWrite....
		
		int result = service.insert(dto);
		if(result >0) {
			response.sendRedirect(request.getContextPath()+"/myrecord");
		}else {
			
		}
		//
	}
}
