package myPkg;

import java.io.IOException;

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
		request.setAttribute("pageNum", pageNum);
		
		
		// cnt를 froncontroller에서 해도 되지만 updateCommand에서 해도 ㄱㅊ음!
		response.setContentType("text/html; charset=utf-8");
		if(cnt != 1) {
			try {
				response.getWriter().append("<script>alert('비밀번호가 일치하지 않습니다');history.go(-1);</script>");
				response.getWriter().flush(); // alert 을 브라우저에 내보내기 위한 코드.
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("match", "false");
		}//if
		else { // 수정성공
			request.setAttribute("match", "true");
		}
	}

}
