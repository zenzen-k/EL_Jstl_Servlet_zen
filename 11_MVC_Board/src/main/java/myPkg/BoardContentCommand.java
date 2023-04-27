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
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("bb", bb);
	}

}
