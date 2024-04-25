package swithme.model.myrecord.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import swithme.model.member.dto.MemberInfoDto;
import swithme.model.myrecord.dto.DateDifftimeDto;
import swithme.model.myrecord.dto.DayStudyTimeBySubjectDto;
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
			System.out.println("----------------daystudytime contoroller : ");
			List<DayStudyTimeBySubjectDto> result = service.dayStudyTime(((MemberInfoDto)request.getSession().getAttribute("loginInfo")).getMemId());
			System.out.println("\n\n 기록 : "+result);
			List<DayStudyTimeDto> result2 = service.fourdayStudyTime(((MemberInfoDto)request.getSession().getAttribute("loginInfo")).getMemId());
			
			//30일치
			List<DateDifftimeDto> result3=service.thirtydayStudyTime(((MemberInfoDto)request.getSession().getAttribute("loginInfo")).getMemId());
			List<DayStudyTimeDto> result4 = service.thirtydayStudyTimeBySubject(((MemberInfoDto)request.getSession().getAttribute("loginInfo")).getMemId());
			//누적
			List<DateDifftimeDto> result5=service.accStudyTime(((MemberInfoDto)request.getSession().getAttribute("loginInfo")).getMemId());
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("dayStudyTimeList", result);				//오늘의 과목별 학습 시간
			resultMap.put("fourdayStudyTimeList", result2); 		//과목별 학습 4일치
			resultMap.put("thirtydayStudyTime", result3); 			//하루 학습시간 30일치
			resultMap.put("thirtydayStudyTimeBySubject", result4); 	//하루 과목별 학습시간 30일치
			resultMap.put("accStudyTime", result5); 	//누적학습시간
			
			
			
			System.out.println("-------- resultMap의 map내용을 보시라!! -- \n");
			System.out.println(resultMap);
			response.getWriter().append(new Gson().toJson(resultMap));
		//이게 맞나..???
		}catch(NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"/myrecord");
		}
	}
}
