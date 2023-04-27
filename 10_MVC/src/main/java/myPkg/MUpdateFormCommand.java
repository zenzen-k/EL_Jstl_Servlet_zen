package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MUpdateFormCommand implements MCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("num");
		MovieDao mdao = MovieDao.getInstance();
		MovieBean mb = mdao.getMovieByNum(num);
		request.setAttribute("mb", mb);
	}

}
