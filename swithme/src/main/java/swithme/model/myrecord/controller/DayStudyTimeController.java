package swithme.model.myrecord.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import swithme.model.member.dto.MemberInfoDto;
import swithme.model.myrecord.dto.DayStudyTimeDto;
import swithme.model.myrecord.dto.RecordTimeDto;
import swithme.model.myrecord.service.RecordService;

/**
 * Servlet implementation class RecoradStartTimeController
 */
@WebServlet("/myrecord/todayrecord.ajax")
public class DayStudyTimeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RecordService service = new RecordService();
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DayStudyTimeController() {
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
		try {		
			String num = request.getParameter("numnum");
			System.out.println("---------------- contoroller : "+num);
			List<DayStudyTimeDto> result = service.dayStudyTime(((MemberInfoDto)request.getSession().getAttribute("loginInfo")).getMemId());
		System.out.println(result);
		response.getWriter().append(new Gson().toJson(result));
		//이게 맞나..???
		}catch(NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"/myrecord");
		}

	}

}
