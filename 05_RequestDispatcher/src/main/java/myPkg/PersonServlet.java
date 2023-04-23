package myPkg;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PersonServlet
 */
@WebServlet("/person2")
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		String[] hobby = request.getParameterValues("hobby");
		String c = request.getParameter("c");
		String java = request.getParameter("java");
		String jsp = request.getParameter("jsp");
		
		// 1번방법 속성설정
		request.setAttribute("id", id);
		request.setAttribute("passwd", passwd);
		request.setAttribute("name", name);
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("hobby", hobby);
		request.setAttribute("c", c);
		request.setAttribute("java", java);
		request.setAttribute("jsp", jsp);
		
		// 2번방법 Bean객체 설정
		PersonBean pb = new PersonBean();
		pb.setId(id);
		pb.setPasswd(passwd);
		pb.setName(name);
		pb.setYear(year);
		pb.setMonth(month);
		pb.setDay(day);
		pb.setHobby(hobby);
		pb.setC(Integer.parseInt(c));
		pb.setJava(Integer.parseInt(java));
		pb.setJsp(Integer.parseInt(jsp));
		request.setAttribute("pb", pb);
		
		// 3번방법 객체 바로 전송 (parameter)
		RequestDispatcher dispatch = request.getRequestDispatcher("result_김아연.jsp");
		dispatch.forward(request, response);
	}

}
