package server;

import dao.MemberDAO;

public class MemberService {
	public int signIn(String id, String pwd) {
		MemberDAO dao = new MemberDAO();
		return dao.signIn(id, pwd);
	}
}
