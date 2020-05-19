package service;

import dao.MemberDAO;
import model.Member;
/**
 * @Author : Choi
 * */
public class MemberService {
	public int signIn(String id, String pwd) {
		MemberDAO memberDao = new MemberDAO();
		return memberDao.signIn(id, pwd);
	}
	public int signUp(Member member) {
		MemberDAO memberDao = new MemberDAO();
		// state = -1 fail;
		int state = -1;
		state = memberDao.signUp(member);
		return state;
	}
}
