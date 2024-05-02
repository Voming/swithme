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

@WebServlet("/myrecord/recordstart.ajax")
public class RecoradStartTimeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RecordService service = new RecordService();
	public RecoradStartTimeController() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//jsp-> servlet 정보 받아오기
		String subjectIdStr = request.getParameter("subjectId");
		String startTime = request.getParameter("startTime");
		int subjectId = Integer.parseInt(subjectIdStr);
		
		//class로 정보 전달
		int result = service.insertStartTime(new RecordTimeDto(subjectId,((MemberInfoDto)request.getSession().getAttribute("loginInfo")).getMemId(), startTime));
		//servlet으로 전달
		response.getWriter().append(String.valueOf(result));
	}

}
