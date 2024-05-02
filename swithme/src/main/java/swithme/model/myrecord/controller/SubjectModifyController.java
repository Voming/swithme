package swithme.model.myrecord.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.member.dto.MemberInfoDto;
import swithme.model.myrecord.dto.SubjectModifyDto;
import swithme.model.myrecord.service.SubjectService;


@WebServlet("/myrecord/modify.ajax")
public class SubjectModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SubjectService service = new SubjectService();

    public SubjectModifyController() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String subjectName= request.getParameter("subjectName");
		String modifySubName= request.getParameter("subNameModi");
		String modifySubColor= request.getParameter("colorModi");
		
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		String memId = loginInfo.getMemId();
		SubjectModifyDto dto = new SubjectModifyDto(memId, subjectName, modifySubName, modifySubColor);
		int result = service.update(dto);
		response.getWriter().append(String.valueOf(result));
//		List<SubjectDifftimeDto> sublist = service.insertSubjectAndSelectRecord(dto);
		//request.setAttribute("sublist", sublist);
	}
}
