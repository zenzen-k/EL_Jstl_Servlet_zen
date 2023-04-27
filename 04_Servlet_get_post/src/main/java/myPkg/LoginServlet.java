package myPkg;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("service");
		String method = request.getMethod(); // 어떤 방식으로 요청했ㄴㄴ지
		System.out.println(method);
		
		if(method.equalsIgnoreCase("post")) {
			doPost(request, response);
		}else {
			doGet(request, response);
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		response.setContentType("text/html; charset=utf-8"); // 내보내는 데이터 한글처리(아이디 : 비밀버호 : )
		request.setCharacterEncoding("utf-8"); // 요청한데이터 한글처리 (id, passwd)
		
		PrintWriter out = response.getWriter();
		out.append("아이디 : " + request.getParameter("id") + "<br>");
		out.append("비밀번호 : " + request.getParameter("passwd") + "<br>");
		out.append("취미 : ");
		String[] hobby = request.getParameterValues("hobby");
		for(String h : hobby) {
			out.append(h + " ");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doGet(request, response);
	}

}
