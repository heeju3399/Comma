package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import server.MemberService;

@WebServlet("/sign_in")
public class SignInController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService memberService = new MemberService();
		// request->get parameter id;
		// request->get parameter pwd
		String id = "";
		String pwd = "";
		int signInState = memberService.signIn(id, pwd);
		
	}

}
