package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MDeleteCommand implements MCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String[] numArr = request.getParameterValues("rowchk");
		String num = request.getParameter("num");
		
		MovieDao mdao = MovieDao.getInstance();
		
		if(numArr==null) {
			mdao.deleteMovie(num);
		}else {
			mdao.selectDel(numArr);
		}
	}

}
