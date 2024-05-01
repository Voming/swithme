package swithme.model.ranking.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import swithme.model.member.dto.MemberInfoDto;
import swithme.model.myrecord.dto.DateDifftimeDto;
import swithme.model.myrecord.service.RecordService;


/**
 * Servlet implementation class RankingMonthlyController
 */
@WebServlet("/ranking/monthly")
public class RankingMonthlyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RecordService service = new RecordService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RankingMonthlyController() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		MemberInfoDto loginInfo = (MemberInfoDto)request.getSession().getAttribute("loginInfo");
		
		if (loginInfo != null ) { //로그인 했을 때
			memId = loginInfo.getMemId();
			List<DateDifftimeDto> monthlyTime = service.monthStudyTime(memId);
			System.out.println(monthlyTime);
			
			request.setAttribute("monthlyTime", monthlyTime);
			response.getWriter().append(new Gson().toJson(monthlyTime));
		}
	}

}
