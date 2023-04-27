package svy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("*.sv")
public class SurveyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ServletContext sc; // 플젝당한개~!~~!~!
	SurveyDao sdao;
       
    public SurveyServlet() {
        super();
    }
    
    public void init(ServletConfig config) throws ServletException {
    	sc = config.getServletContext();
    	
    	String driver = config.getInitParameter("driver");
    	String url = config.getInitParameter("url");
    	String user = config.getInitParameter("user");
    	String password = config.getInitParameter("password");
    	
    	sdao = new SurveyDao(driver, url, user, password);
	}

	public void destroy() {
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 꼭 여기서 한글처리하기
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command = uri.substring(path.length());
		String viewPage = "";
		
		System.out.println("command : " + command);
		
		//SurveyDao sdao = new SurveyDao();
		
		if(command.equals("/insert.sv")) {
			String flag = (String) sc.getAttribute("flag");
			if(flag.equals("false")) {

				String name = request.getParameter("name");
				String company = request.getParameter("company");
				String email = request.getParameter("email");
				String satisfaction = request.getParameter("satisfaction");
				String[] part = request.getParameterValues("part");
				String howto = request.getParameter("howto");
				String agree = request.getParameter("agree");
				int ag = 1; //  체크함
				if(agree == null) { // 체크안함
					ag = 0;
				}
				
				SurveyBean sb = new SurveyBean(0, name, company, email, satisfaction, part, howto, ag);
				sdao.insertSurvey(sb);
				
				sc.setAttribute("flag", "ture");
			}
			
			viewPage = "/list.sv"; // 이전 요청방식과 동일하다. 이건 post로 넘어가서 여기서도 post방식.
		}
		else if(command.equals("/updateForm.sv")) {
			String no = request.getParameter("no");
			SurveyBean sb = sdao.getOneSurvey(no);
			request.setAttribute("sb", sb);
			viewPage = "Ex03_surveyUpdateForm.jsp";
		}
		else if(command.equals("/update.sv")) {
			//sdao.updateSurvey();
			// 생성자말고 넘어온 request 값을 sb에 바로 넣어도 ㄱㅊ
			int no = Integer.parseInt(request.getParameter("no"));
			String name = request.getParameter("name");
			String company = request.getParameter("company");
			String email = request.getParameter("email");
			String satisfaction = request.getParameter("satisfaction");
			String[] part = request.getParameterValues("part");
			String howto = request.getParameter("howto");
			String agree = request.getParameter("agree");
			int ag = 1;
			if(agree == null) {
				ag = 0;
			}
			SurveyBean sb = new SurveyBean(no, name, company, email, satisfaction, part, howto, ag);
			sdao.updateSurvey(sb);
			viewPage = "/list.sv";
		}
		else if(command.equals("/delete.sv")) {
			String no = request.getParameter("no");
			sdao.deleteSurvey(no);
			
			viewPage = "/list.sv";
		}
		else if(command.equals("/list.sv")) {
			ArrayList<SurveyBean> list = sdao.getAllSurvey();
			request.setAttribute("list", list);
			viewPage = "Ex03_surveyList.jsp";
		}
		
		System.out.println("viewPage : " + viewPage);
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
