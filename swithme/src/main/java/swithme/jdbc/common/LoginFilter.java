package swithme.jdbc.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter(filterName = "loginFilter", urlPatterns = { "/mypage/*", "/myrecord/*", "/group/*", "/board/*" })
public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		

		if (session.getAttribute("loginInfo") == null) {
			String prePage = req.getParameter("prePage");
			if (prePage != null) { // 이전에 온 페이지 어딘지 체크
				System.out.println("LoginFilter : " + prePage);
				if (prePage.equals("group")) {
					req.getSession().setAttribute("prePage", "group");
					res.sendRedirect(req.getContextPath() + "/welcome");
				}
			}
			res.sendRedirect(req.getContextPath() + "/welcome");
		} else {
			chain.doFilter(request, response);
		}
	}

}
