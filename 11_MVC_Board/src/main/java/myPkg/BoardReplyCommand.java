package myPkg;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardBean;
import board.BoardDao;

public class BoardReplyCommand implements BoardCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		BoardBean bb = new BoardBean();
		bb.setRef(Integer.parseInt(request.getParameter("ref")));
		bb.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		bb.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		bb.setWriter(request.getParameter("writer"));
		bb.setEmail(request.getParameter("email"));
		bb.setSubject(request.getParameter("subject"));
		bb.setPasswd(request.getParameter("passwd"));
		bb.setContent(request.getParameter("content"));
		// 숫자를 날짜로
		bb.setReg_date(new Timestamp(System.currentTimeMillis()));
		// 요청한 사람의 ip 주소
		bb.setIp(request.getRemoteAddr());
		
		BoardDao bdao = BoardDao.getInstance();
		bdao.replyArticle(bb);
		request.setAttribute("pageNum", pageNum);
	}

}
