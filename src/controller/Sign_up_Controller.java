package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import javafx.beans.property.SetProperty;
import model.Member;

@WebServlet("/sign_up")
public class Sign_up_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		Member bean = new Member();
		bean.setM_id(request.getParameter("id"));
		bean.setM_pwd(request.getParameter("pwd"));
		bean.setM_birth(request.getParameter("birthday"));
		bean.setM_email(request.getParameter("email"));
					
		boolean result = dao.insertMember(bean);
		System.out.println(result);
	}

}
