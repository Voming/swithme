package swithme.model.testcalendar.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import swithme.model.testcalendar.service.TestCalService;

@WebServlet("/testcalendar")
public class TestCalController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TestCalService service = new TestCalService();
  
    public TestCalController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1 : 기술사 2: 기능장 3: 기사 산업기사
//		service.testCalApiCall(1); 
//		service.testCalApiCall(2);
		service.testCalApiCall(3);
		request.getRequestDispatcher("/WEB-INF/views/testcalendar/testcalendar.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
