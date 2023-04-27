package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDao;

public class BoardDeleteCommand implements BoardCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("num");
		String passwd = request.getParameter("passwd");
		String pageNum = request.getParameter("pageNum");
		
		BoardDao bdao = BoardDao.getInstance();
		int cnt = bdao.deleteArticle(num, passwd);
		
		if(cnt == 1){
			int pageSize = 5;
			int count = bdao.getArticleCount();
			int pageCount = count/pageSize + (count%pageSize==0? 0 : 1);
			System.out.println("pageCount : " + pageCount);
			System.out.println("count : " + count);
			
			int pageN = Integer.parseInt(pageNum);
			System.out.println("pageN : " + pageN);
			if(pageCount < pageN){
				pageNum = String.valueOf(pageN-1);
			}
		}
		
		System.out.println("cnt : " + cnt);
		System.out.println("num : " + num);
		System.out.println("passwd : " + passwd);
		System.out.println("pageNum : " + pageNum);
		
		request.setAttribute("cnt", cnt);
		request.setAttribute("num", num);
		request.setAttribute("passwd", passwd);
		request.setAttribute("pageNum", pageNum);
	}
	
}
