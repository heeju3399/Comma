package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

@WebServlet("/sign_in")
public class SignInController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO mgr = new MemberDAO();
		String id = request.getParameter("m_id");
		String pwd = request.getParameter("m_pwd");

		int result = mgr.signIn(id, pwd);
		System.out.println(result);
	}

}
