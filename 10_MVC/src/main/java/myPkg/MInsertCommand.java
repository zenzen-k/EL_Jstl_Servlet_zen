package myPkg;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MInsertCommand implements MCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
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
			for(int i=0; i<genre.length; i++){
				str += genre[i] + ",";
			}
		}
		MovieBean mb = new MovieBean(0, id, name, age, str, time, partner, memo);
		MovieDao mdao = MovieDao.getInstance();
		mdao.insertMovie(mb);
		
		// 여기서 처리하려면 이렇게 작성하기
		/*ServletContext sc = request.getServletContext();
		sc.setAttribute("flag", "true");*/
	}

}
