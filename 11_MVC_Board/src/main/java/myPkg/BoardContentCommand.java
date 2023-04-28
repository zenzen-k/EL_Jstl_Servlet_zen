package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardBean;
import board.BoardDao;

public class BoardContentCommand implements BoardCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		String num = request.getParameter("num");
		
		BoardDao bdao = BoardDao.getInstance();
		BoardBean bb = bdao.getArticleByNum(num);
		
		// 별도로 챙기지 않아도 get방식으로 넘겼기 때문에 굳이 챙길 필요는 없음.
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("bb", bb);
	}

}
