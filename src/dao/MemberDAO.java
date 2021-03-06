package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Member;

public class MemberDAO {

	private DatabaseDAO pool;

	public MemberDAO() {
		pool = DatabaseDAO.getInstance();
	}

		public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select m_id from tblMember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	
	public int signUp(Member member) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		int state = -1;
		
		try {
			con = pool.getConnection();
			
			sql = " insert tbl_member(m_id,m_pwd,m_email,m_birth,m_visited,m_auth) "
					+ " values(?,?,?,?,now()) ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			pstmt.setString(2, member.getM_pwd());
			pstmt.setString(3, member.getM_email());
			pstmt.setString(4, member.getM_birth());
			
			
			state = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return state;
	}

	// 濡쒓렇�씤
	public int signIn(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int state = 0;
		// 0-id false, 1-id true pass-false, 2-id&pass true
		try {
			if (!checkId(id))
				return state;
			con = pool.getConnection();
			sql = "select id, pwd from tbl_Member where m_id = ? and m_pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if (rs.next())
				state = 2;// pass
			else
				state = 1;// id true, pass fail
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("硫ㅻ쾭濡쒓렇�씤 �뿉�윭" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return state;
	}

	// �쉶�썝�젙蹂� 媛��졇�삤湲�//愿�由ъ옄 �럹�씠吏�?????
	public Member getMember(String id) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Member bean = new Member();
		try {
			con = pool.getConnection();
			sql = "select * from tbl_Member where m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setM_id(rs.getString("m_id"));
				bean.setM_pwd(rs.getString("m_pwd"));
				bean.setM_email(rs.getString("m_email"));
				bean.setM_birth(rs.getString("m_birth"));
				bean.setM_visited(rs.getString("m_visited"));
				bean.setM_auth(rs.getString("m_auth"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// �쉶�썝�젙蹂� �닔�젙
	public boolean updateMember(Member bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = " update tbl_member set m_pwd=?, m_email=?, m_birth=?, " + " m_auth=? where id=? ";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getM_pwd());
			pstmt.setString(2, bean.getM_email());
			pstmt.setString(3, bean.getM_birth());
			pstmt.setString(4, bean.getM_auth());
			pstmt.setString(5, bean.getM_id());

			if (pstmt.executeUpdate() == 1)
				flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	/// admin mode/////////////愿�由ъ옄 �럹�씠吏�
//		public Vector<Member> getMemberList() {
//			Connection con = null;
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			String sql = null;
//			Vector<Member> vlist = new Vector<>();
//			try {
//				con = pool.getConnection();
//				sql = "select * from tblMember";
//				pstmt = con.prepareStatement(sql);
//				rs = pstmt.executeQuery();
//				while (rs.next()) {
//					Member bean = new Member();
//					bean.setId(rs.getString("id"));
//					bean.setPwd(rs.getString("pwd"));
//					bean.setName(rs.getString("name"));
//					bean.setGender(rs.getString("gender"));
//					bean.setBirthday(rs.getString("birthday"));
//					bean.setEmail(rs.getString("email"));
//					vlist.addElement(bean);
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				pool.freeConnection(con, pstmt, rs);
//			}
//			return vlist;
//		}
	//
//		//Admin Login
//		public boolean adminCheck(String admin_id, String admin_pwd) {
//			Connection con = null;
//			PreparedStatement pstmt = null;
//			ResultSet rs = null;
//			String sql = null;
//			boolean flag = false;
//			try {
//				con = pool.getConnection();
//				sql = "select admin_id, admin_pwd from tblAdmin where admin_id = ? and admin_pwd = ?";
//				pstmt = con.prepareStatement(sql);
//				pstmt.setString(1, admin_id);
//				pstmt.setString(2, admin_pwd);
//				rs = pstmt.executeQuery();
//				flag = rs.next();
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				pool.freeConnection(con);
//			}
//			return flag;
//		}
	//
//		//Send id, pwd
//		public void sendAccount(String id) {
//			Member bean = getMember(id);
//			String pwd = bean.getPwd();
//			String title = "OOO.com�뿉�꽌 �븘�씠�뵒�� 鍮꾨�踰덊샇 �쟾�넚�빀�땲�떎.";
//			String content = "<font color='red'><b>id : " + id; 
//			content+= " / pwd : " + pwd+"</b></font>";
//			String toEmail = bean.getEmail();
//			MailSend.send(title, content, toEmail);
//		}

}
