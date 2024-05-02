package swithme.model.myrecord.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.member.dto.MemberInfoDto;
import swithme.model.myrecord.dto.RecordTimeDto;
import swithme.model.myrecord.service.RecordService;

@WebServlet("/myrecord/recordend.ajax")
public class RecoradEndTimeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RecordService service = new RecordService();
	
	public RecoradEndTimeController() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subjectIdStr = request.getParameter("subjectId");
		String endTime = request.getParameter("endTime");
		int subjectId = Integer.parseInt(subjectIdStr);
		int result = service.insertEndTime(new RecordTimeDto(subjectId,((MemberInfoDto)request.getSession().getAttribute("loginInfo")).getMemId(), endTime));
		response.getWriter().append(String.valueOf(result));
	}
}
