package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MUpdateCommand implements MCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String[] genre = request.getParameterValues("genre");
		String time = request.getParameter("time");
		int partner = Integer.parseInt(request.getParameter("partner"));
		String memo = request.getParameter("memo");
		
		String str = "";
		if(genre == null) {
			str = "선택사항없음";
		}else {
			for(int i=0; i<genre.length-1; i++){
				str += genre[i] + ",";
			}
		}
		MovieBean mb = new MovieBean(num, id, name, age, str, time, partner, memo);
		MovieDao mdao = MovieDao.getInstance();
		mdao.updateMovie(mb);
		
	}

}
