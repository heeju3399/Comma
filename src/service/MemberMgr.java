package service;
/*
 * package manager;
 * 
 * import java.sql.Connection; import java.sql.PreparedStatement; import
 * java.sql.ResultSet; import java.util.Vector;
 * 
 * import bean.MailSend; import bean.MemberBean; import bean.ZipcodeBean;
 * 
 * public class MemberMgr {
 * 
 * private DBConnectionMgr pool;
 * 
 * public MemberMgr() { pool = DBConnectionMgr.getInstance(); }
 * 
 * // ID 중복확인 public boolean checkId(String m_id) { Connection con = null;
 * PreparedStatement pstmt = null; ResultSet rs = null; String sql = null;
 * boolean flag = false; try { con = pool.getConnection(); sql =
 * "select m_id from tbl_member where m_id=?"; pstmt =
 * con.prepareStatement(sql); pstmt.setString(1, m_id); rs =
 * pstmt.executeQuery();// sql문 실행 flag = rs.next();// true이면 중복, false 중복아님. }
 * catch (Exception e) { e.printStackTrace(); } finally {
 * pool.freeConnection(con, pstmt, rs); } return flag; }
 * 
 * // 회원가입 public boolean insertMember(MemberBean memberBean) { Connection con =
 * null; PreparedStatement pstmt = null; String sql = null; boolean flag =
 * false; try { con = pool.getConnection(); sql =
 * "insert tbl_member(id,pwd,name,gender," +
 * "birthday,email,zipcode,address,hobby,job)" + "values(?,?,?,?,?,?,?,?,?,?)";
 * pstmt = con.prepareStatement(sql); pstmt.setString(1, memberBean.getM_id());
 * pstmt.setString(2, memberBean.getM_pwd()); pstmt.setString(3,
 * memberBean.getM_email()); pstmt.setString(4, memberBean.getM_birth());
 * pstmt.setString(5, memberBean.getM_visited()); pstmt.setString(6,
 * memberBean.getM_auth()); if (pstmt.executeUpdate() == 1) flag = true; } catch
 * (Exception e) { e.printStackTrace(); } finally { pool.freeConnection(con,
 * pstmt); } return flag; }
 * 
 * // 로그인 public int loginMember(String m_id, String m_pwd) { Connection con =
 * null; PreparedStatement pstmt = null; ResultSet rs = null; String sql = null;
 * int mode = 0; // 0-id false, 1-id true pass-false, 2-id&pass true try { if
 * (!checkId(m_id)) return mode; con = pool.getConnection(); sql =
 * "select m_id, m_pwd from tbl_member where m_id = ? and m_pwd = ?"; pstmt =
 * con.prepareStatement(sql); pstmt.setString(1, m_id); pstmt.setString(2,
 * m_pwd); rs = pstmt.executeQuery(); if (rs.next()) mode = 2; else mode = 1; }
 * catch (Exception e) { e.printStackTrace(); } finally {
 * pool.freeConnection(con, pstmt, rs); } return mode; }
 * 
 * // 회원정보 가져오기 public MemberBean getMember(String m_id) { Connection con =
 * null; PreparedStatement pstmt = null; ResultSet rs = null; String sql = null;
 * MemberBean bean = new MemberBean(); try { con = pool.getConnection(); sql =
 * "select * from tbl_member where m_id = ?"; pstmt = con.prepareStatement(sql);
 * pstmt.setString(1, m_id); rs = pstmt.executeQuery(); if (rs.next()) {
 * bean.setM_id(rs.getString("m_id")); bean.setM_pwd(rs.getString("m_pwd"));
 * bean.setM_email(rs.getString("m_email"));
 * bean.setM_birth(rs.getString("m_birth"));
 * bean.setM_visited(rs.getString("m_visted"));
 * bean.setM_auth(rs.getString("m_auth")); } } catch (Exception e) {
 * e.printStackTrace(); } finally { pool.freeConnection(con, pstmt, rs); }
 * return bean; }
 * 
 * // 회원정보 수정 public boolean updateMember(MemberBean bean) { Connection con =
 * null; PreparedStatement pstmt = null; String sql = null; boolean flag =
 * false; try { con = pool.getConnection(); sql =
 * "update tbl_member set pwd=?, name=?, gender=?," +
 * "birthday=?, email=?, zipcode=?, address=?,  " + "hobby=?, job=? where id=?";
 * pstmt = con.prepareStatement(sql); pstmt.setString(1, bean.getPwd());
 * pstmt.setString(2, bean.getName()); pstmt.setString(3, bean.getGender());
 * pstmt.setString(4, bean.getBirthday()); pstmt.setString(5, bean.getEmail());
 * pstmt.setString(6, bean.getZipcode()); pstmt.setString(7, bean.getAddress());
 * String hobby[] = bean.getHobby(); char hb[] = { '0', '0', '0', '0', '0' };
 * String lists[] = { "인터넷", "여행", "게임", "영화", "운동" }; if (hobby != null) { for
 * (int i = 0; i < hobby.length; i++) { for (int j = 0; j < lists.length; j++) {
 * if (hobby[i].equals(lists[j])) { hb[j] = '1';
 * 
 * break; } // ---if } // ---for2 } // ---for1 } pstmt.setString(8, new
 * String(hb)); /////////////////////////////////// pstmt.setString(9,
 * bean.getJob()); pstmt.setString(10, bean.getId()); if (pstmt.executeUpdate()
 * == 1) flag = true; } catch (Exception e) { e.printStackTrace(); } finally {
 * pool.freeConnection(con, pstmt); } return flag; }
 * 
 * /// admin mode///////////// public Vector<MemberBean> getMemberList() {
 * Connection con = null; PreparedStatement pstmt = null; ResultSet rs = null;
 * String sql = null; Vector<MemberBean> vlist = new Vector<>(); try { con =
 * pool.getConnection(); sql = "select * from tbl_member"; pstmt =
 * con.prepareStatement(sql); rs = pstmt.executeQuery(); while (rs.next()) {
 * MemberBean bean = new MemberBean(); bean.setId(rs.getString("id"));
 * bean.setPwd(rs.getString("pwd")); bean.setName(rs.getString("name"));
 * bean.setGender(rs.getString("gender"));
 * bean.setBirthday(rs.getString("birthday"));
 * bean.setEmail(rs.getString("email")); vlist.addElement(bean); } } catch
 * (Exception e) { e.printStackTrace(); } finally { pool.freeConnection(con,
 * pstmt, rs); } return vlist; }
 * 
 * // Admin Login public boolean adminCheck(String admin_id, String admin_pwd) {
 * Connection con = null; PreparedStatement pstmt = null; ResultSet rs = null;
 * String sql = null; boolean flag = false; try { con = pool.getConnection();
 * sql =
 * "select admin_id, admin_pwd from tblAdmin where admin_id = ? and admin_pwd = ?"
 * ; pstmt = con.prepareStatement(sql); pstmt.setString(1, admin_id);
 * pstmt.setString(2, admin_pwd); rs = pstmt.executeQuery(); flag = rs.next(); }
 * catch (Exception e) { e.printStackTrace(); } finally {
 * pool.freeConnection(con); } return flag; }
 * 
 * // Send id, pwd public void sendAccount(String id) { MemberBean bean =
 * getMember(id); String pwd = bean.getPwd(); String title =
 * "OOO.com에서 아이디와 비밀번호 전송합니다."; String content = "<font color='red'><b>id : " +
 * id; content += " / pwd : " + pwd + "</b></font>"; String toEmail =
 * bean.getEmail(); MailSend.send(title, content, toEmail); } }
 */