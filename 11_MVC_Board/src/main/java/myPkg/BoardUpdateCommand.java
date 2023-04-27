package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardBean;
import board.BoardDao;

public class BoardUpdateCommand implements BoardCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardBean bb = new BoardBean();
		String pageNum = request.getParameter("pageNum");
		bb.setNum(Integer.parseInt(request.getParameter("num")));
		bb.setWriter(request.getParameter("writer"));
		bb.setEmail(request.getParameter("email"));
		bb.setSubject(request.getParameter("subject"));
		bb.setPasswd(request.getParameter("passwd"));
		bb.setContent(request.getParameter("content"));
		
		BoardDao bdao = BoardDao.getInstance();
		int cnt = bdao.updateArticle(bb);
		request.setAttribute("cnt", cnt);
	}

}
