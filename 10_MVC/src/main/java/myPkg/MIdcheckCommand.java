package myPkg;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MIdcheckCommand implements MCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String userid = request.getParameter("userid");
		MovieDao mdao = MovieDao.getInstance();
		boolean result = mdao.searchId(userid);
		
		// true이면 가입못함 (테이블 존재)
		try {
			if (result) {
				// jsp에서는 out 객체가 웹브라우저와 연결했지만
				// 자바는 getWriter! (PrintWriter 객체)
				response.getWriter().append("N");
			} else {
				response.getWriter().append("Y");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
