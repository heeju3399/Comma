package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import unused.MemberBean;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/test")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberBean memberBean1 = new MemberBean("user","12342","test1@email.com","890101","2020-05-14","user");
		MemberBean memberBean2 = new MemberBean("admin","12342","test2@email.com","890102","2020-05-13","admin");
		MemberBean memberBean3 = new MemberBean("root","12342","test3@email.com","890103","2020-05-11","user");
		ArrayList<MemberBean> _members = new ArrayList<MemberBean>();
		_members.add(memberBean1);
		_members.add(memberBean2);
		_members.add(memberBean3);
		request.setAttribute("members", _members );
		request.getRequestDispatcher("test.jsp").forward(request, response);
	}

}
