package myPkg;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardBean;
import board.BoardDao;

public class BoardListCommand implements BoardCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// 한 페이지에 보여지는 페이지 수
		int pageSize = 5;
		
		// 내가 선택한 페이지 번호
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){
			pageNum = "1";
		}
		
		// 페이지 번호 설정하기
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize + 1; // 1페이지라면 (1-1) * 5 +1 = 1
		int endRow = currentPage * pageSize; // 1페이지라면 1 * 5 = 5
		
		// 전체 레코드 수와 글목록 가져오기. 글이 없으면 lists = null임.
		BoardDao bdao = BoardDao.getInstance();
		ArrayList<BoardBean> lists = null;
		int count = bdao.getArticleCount(); // 전체레코드수
		if(count > 0){
			lists = bdao.getArticles(startRow, endRow);
		}

		// 목록에 보여질 번호. 거꾸로 카운트 해야함!@
		int number = count-(currentPage-1) * pageSize +1;
		
		// jsp에서 필요한 값 속성으로 넘기기
		request.setAttribute("count", count);
		request.setAttribute("lists", lists);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("pageNum", pageNum);
	}

}
