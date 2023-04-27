package myPkg;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MListCommand implements MCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MovieDao mdao = MovieDao.getInstance();
		ArrayList<MovieBean> lists = mdao.getAllMovie();
		request.setAttribute("lists", lists);
	}

}
