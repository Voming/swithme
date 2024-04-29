package swithme.model.testcalendar.controller;

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

import swithme.model.testcalendar.dto.IndEngineerSetDto;
import swithme.model.testcalendar.dto.MasterCraftsmentSetDto;
import swithme.model.testcalendar.dto.ProEngineerSetDto;
import swithme.model.testcalendar.service.TestCalService;

/**
 * Servlet implementation class TestCalGetController
 */
@WebServlet("/test/event.ajax")
public class TestCalEventController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TestCalService service = new TestCalService();
    public TestCalEventController() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ProEngineerSetDto> prolist = service.selectProList();
		List<MasterCraftsmentSetDto> masterlist = service.selectMasterList();
		List<IndEngineerSetDto> indlist = service.selectIndList();
//		System.out.println(prolist);
//		System.out.println(masterlist);
//		System.out.println(indlist);
		//1 : 기술사 2: 기능장 3: 기사 산업기사
		Map<String, Object> allList = new HashMap<String, Object>();
		allList.put("기술사", prolist);
		allList.put("기능장", masterlist);
		allList.put("기사,산업기사", indlist);
		
		System.out.println("allList : " + allList);
		Gson gson = new Gson();
		response.getWriter().append(gson.toJson(prolist));
		
	}

}
