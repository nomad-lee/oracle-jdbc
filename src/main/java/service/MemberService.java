package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.MemberDao;
import util.DBUtil;
import vo.Member;

public class MemberService {
	private DBUtil DBUtil;
	private MemberDao memberDao;
	
	public Member loginService(Member paramMember) {
		Connection conn = null;
		Member loginMember = null;
		
		this.memberDao = new MemberDao();
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			loginMember = memberDao.login(conn, paramMember);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return loginMember;
	}
}
