package swithme.model.ranking.controller;

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
import swithme.model.myrecord.service.RecordService;
import swithme.model.ranking.dto.RankingDto;

/**
 * Servlet implementation class RankingDailyController
 */
@WebServlet("/ranking/daily")
public class RankingDailyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RecordService service = new RecordService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RankingDailyController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("memId");
		MemberInfoDto loginInfo = (MemberInfoDto) request.getSession().getAttribute("loginInfo");
		
		//이 두개의 값을 controller 통해 보냄
		RankingDto dailyTop = service.rankingDailyTop();
		Integer dailyTopTime = dailyTop.getDifftime();
		//dailyTop 의 자료형이 RankingDto 라서 RankingDto 안에 있는것들 사용 가능
		//jsp에서 css로 시간 설정할때는 1등 시간만 있으면 되서 1등 시간만 가져옴(1등 시간이 기준이 되므로)
		
		Map<String, Object> map = new HashMap<String, Object>();
		//처음에는 List형태로 받았는데 값 여러개 꺼내야해서 Map으로 받음
		//List<RankingDto> 도 넣고 dailyTopTime 도 넣기 위해 Map 사용
		// 자료형이 섞여도 상관없음
		map.put("dailyTopTime", dailyTopTime);
		//보낸 값을 다시 받아서 map 형태에 넣음
		
		if (loginInfo != null) { // 로그인 했을 때
			memId = loginInfo.getMemId();
			System.out.println("em\\드감?????");
			List<RankingDto> dto = service.rankingDaily();
			//List에는 자료형이 하나만 들어갈 수 있음 => 여기서는 RankingDto 하나만 들어갈 수 있음
			// 자동적으로 index 생성
			//List는 add 했을 때 <> 안에 있는 얘들만 넣는거 가능(dto에 있는 field명과 관련된 얘들이랄까..)
			System.out.println("일간 랭킹" + dto);
			map.put("dailyTime", dto);
			request.setAttribute("dailyTime", dto);

		}
		response.getWriter().append(new Gson().toJson(map));

	}
}
