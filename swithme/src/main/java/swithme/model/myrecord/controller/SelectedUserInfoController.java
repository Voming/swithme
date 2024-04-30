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

@WebServlet("/selecteduser/info")
public class SelectedUserInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private RecordService service = new RecordService();
       
    public SelectedUserInfoController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<RecordCalendarDto> calendarList = null;
				// memId 세션확인
				MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");

				String memId = null;
				if (loginInfo != null ) { //로그인 했을 때
					//TODO memId 받아오기
					memId = "song";//request.getParameter("memId");
					request.setAttribute("memId", memId);
					
					System.out.println("\n\n >>>>>>>>>>    >>>>>>   >>>>>> rankingInfo  sublist");
			
		    		calendarList = service.studyTimeByCalList(memId);
		    		
		    		request.setAttribute("calendarList", calendarList);
					request.getRequestDispatcher("/WEB-INF/views/myrecord/selectedUserInfo.jsp").forward(request, response);
				}
	}
}
