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
import swithme.model.myrecord.dto.RecordCalendarDto;
import swithme.model.myrecord.service.RecordService;

@WebServlet("/group/selecteduser/info")
public class SelectedUserInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RecordService service = new RecordService();
    private String memId;   
    
    public SelectedUserInfoController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// memId 세션확인
				MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");

				if (loginInfo != null ) { //로그인 했을 때
					memId = request.getParameter("memId");
					request.setAttribute("memId", memId);
					request.setAttribute("comment", service.selectComment(memId));
					request.setAttribute("difftime", service.selectTotalDifftime(memId));
					
					request.getRequestDispatcher("/WEB-INF/views/myrecord/selectedUserInfo.jsp").forward(request, response);
				}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {		
			MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");

			String memId = null;
			if (loginInfo != null ) { //로그인 했을 때
				memId = request.getParameter("memId");
				
				List<DayStudyTimeBySubjectDto> result = service.dayStudyTime(memId);
				List<DayStudyTimeDto> result2 = service.fourdayStudyTime(memId);
				//30일치
				List<DateDifftimeDto> result3=service.thirtydayStudyTime(memId);
				List<DayStudyTimeDto> result4 = service.thirtydayStudyTimeBySubject(memId);
				//누적
				List<DateDifftimeDto> result5=service.accStudyTime(memId);
				//월별 
				List<DateDifftimeDto> result6=service.monthStudyTime(memId);
				List<DayStudyTimeDto> result7 = service.monthBySubject(memId);
				//calendar
				List<RecordCalendarDto> calResult = service.studyTimeByCalList(memId);
				
				Map<String, Object> resultMap = new HashMap<String, Object>();
				resultMap.put("dayStudyTimeList", result);				//오늘의 과목별 학습 시간
				resultMap.put("fourdayStudyTimeList", result2); 		//과목별 학습 4일치
				resultMap.put("thirtydayStudyTime", result3); 			//하루 학습시간 30일치
				resultMap.put("thirtydayStudyTimeBySubject", result4); 	//하루 과목별 학습시간 30일치
				resultMap.put("accStudyTime", result5); 	//누적학습시간
				resultMap.put("monthStudyTime", result6); 	//월별 총 학습 시간
				resultMap.put("monthBySubject", result7); 	//월별 과목별 학습시간
				resultMap.put("byCalendar", calResult); 	//달력에 띄울 학습시간
				
				response.getWriter().append(new Gson().toJson(resultMap));
			}
		//이게 맞나..???
		}catch(NumberFormatException e) {
			response.sendRedirect(request.getContextPath()+"/ranking");
		}
	}
}
