package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardBean;
import board.BoardDao;

public class BoardUpdateFormCommand implements BoardCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		String num = request.getParameter("num");
		
		BoardDao bdao = BoardDao.getInstance();
		BoardBean bb = bdao.getContentByNum(num);
		
		request.setAttribute("bb", bb);
		request.setAttribute("pageNum", pageNum);
	}

}
