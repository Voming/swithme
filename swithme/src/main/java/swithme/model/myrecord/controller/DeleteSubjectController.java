package swithme.model.myrecord.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.member.dto.MemberInfoDto;
import swithme.model.myrecord.dto.SubjectDeleteDto;
import swithme.model.myrecord.service.SubjectService;

/**
 * Servlet implementation class RecoradStartTimeController
 */
@WebServlet("/myrecord/deletesubject.ajax")
public class DeleteSubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SubjectService service = new SubjectService();
	public DeleteSubjectController() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String deleteTime = request.getParameter("deleteTime");
		String subjectIdStr = request.getParameter("subjectId");
		int subjectId = Integer.parseInt(subjectIdStr);
		
		int result = service.delete(new SubjectDeleteDto(subjectId,((MemberInfoDto)request.getSession().getAttribute("loginInfo")).getMemId(), deleteTime));
		System.out.println(result);
		response.getWriter().append(String.valueOf(result));
	}

}
