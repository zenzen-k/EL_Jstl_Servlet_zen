package sample;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Singer
 */
//@WebServlet("/singer.do")
public class Singer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String company;
	String singer;
	String manager;
	String title;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Singer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		ServletContext sc = config.getServletContext(); // ServletContext 리턴함.
		
		// ServletConfig : 서블릿당 1개
		// ServletContext : 프로젝트당 1개
		
		// 아까했던 application을 사용해서 xml에서 정의한 프로젝트 전반에 걸쳐사용할 변수를 사용했던 것처럼
		// 이번에는 내가 설정한 sc로 변수를 사용할 수 있다.
		company = sc.getInitParameter("company");
		singer = sc.getInitParameter("singer");
		manager = sc.getInitParameter("manager");
		
		title = config.getInitParameter("title");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().append("회사명 : " + company).append("<br>가수명 : " + singer);
		
		// 또는
		PrintWriter out = response.getWriter();
		out.append("<br>회사명 : " + company);
		out.append("<br>가수명 : " + singer);
		out.append("<br>manager : " + manager);
		out.append("<br>제목 : " + title);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
