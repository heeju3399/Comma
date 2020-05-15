package unused;

import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;

/**
 * @author choi
 *
 */
public class MemberBean {
	private static String cssIdName = "member";
	private static String cssClassRowName = "member";
	private static String tableName = "tbl_member";
	private static String cssClassFieldName[] = { "m_id", "m_pwd", "m_email", "m_birth", "m_visited", "m_auth" };
	private Map<String, String> memberMap;
	private String m_id;
	private String m_pwd;
	private String m_email;
	private String m_birth;
	private String m_visited;
	private String m_auth;

	public MemberBean() {

	}

	public MemberBean(String m_id, String m_pwd, String m_email, String m_birth, String m_visited, String m_auth) {
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_email = m_email;
		this.m_birth = m_birth;
		this.m_visited = m_visited;
		this.m_auth = m_auth;
		memberMap = new HashMap<String, String>();
		memberMap.put("m_id", m_id);
		memberMap.put("m_pwd", m_pwd);
		memberMap.put("m_email", m_email);
		memberMap.put("m_birth", m_birth);
		memberMap.put("m_visited", m_visited);
		memberMap.put("m_auth", m_auth);
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_birth() {
		return m_birth;
	}

	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_visited() {
		return m_visited;
	}

	public void setM_visited(String m_visited) {
		this.m_visited = m_visited;
	}

	public String getM_auth() {
		return m_auth;
	}

	public void setM_auth(String m_auth) {
		this.m_auth = m_auth;
	}

	@Override
	public String toString() {
		return "MemberBean [m_id=" + m_id + ", m_pwd=" + m_pwd + ", m_email=" + m_email + ", m_birth=" + m_birth
				+ ", m_visited=" + m_visited + ", m_auth=" + m_auth + "]";
	}

	public String toJSON() {
		Map<String,Map<String,String>> map = new HashMap<String, Map<String, String>>();
		Map<String, String> member = new HashMap<String,String>();
		member.put("m_id", m_id);
		member.put("m_pwd", m_pwd);
		member.put("m_email", m_email);
		member.put("m_birth", m_birth);
		member.put("m_visited", m_visited);
		member.put("m_auth", m_auth);
		map.put("member", member);
		map.toString();
		Gson gson = new Gson();
		return gson.toJson(map).toString();
	}
	public String toTable() {
		String tr = "";
		tr += "\n<tr class='" + cssClassRowName + "'>";
		for (String fieldName : cssClassFieldName) {
			tr += "\n\t<td class='" + fieldName + "'>";
			tr += "\n\t\t"+memberMap.get(fieldName);
			tr += "\n\t</td>";
		}
		tr += "\r</tr>";
		return tr;

	}
	public static void main(String[] args) {
		MemberBean memberBean1 = new MemberBean("user","12342","test1@email.com","890101","2020-05-14","user");
		System.out.println(memberBean1.toTable());
		System.out.println(memberBean1.toJSON());
	}

}