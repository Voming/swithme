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

/**
 * Servlet implementation class RecoradStartTimeController
 */
@WebServlet("/myrecord/recordstart.ajax")
public class RecoradStartTimeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RecordService service = new RecordService();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecoradStartTimeController() {
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String subjectIdStr = request.getParameter("subjectId");
		String startTime = request.getParameter("startTime");
		int subjectId = Integer.parseInt(subjectIdStr);
		int result = service.insertStartTime(new RecordTimeDto(subjectId,((MemberInfoDto)request.getSession().getAttribute("loginInfo")).getMemId(), startTime));
		System.out.println(result);
		response.getWriter().append(String.valueOf(result));
	}

}
