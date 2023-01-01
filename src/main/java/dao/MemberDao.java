package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBUtil;
import vo.Board;
import vo.Member;

public class MemberDao {
	//로그인 메서드	
	public Member login(Connection conn, Member paramMember) throws Exception {
		Member resultMember = null;
		
		String sql = "SELECT member_id memberId, member_name memberName FROM member WHERE member_id = ? AND member_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, paramMember.getMemberId());
		stmt.setString(2, paramMember.getMemberPw());
		
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			resultMember = new Member();
			resultMember.setMemberId(rs.getString("memberId"));
			resultMember.setMemberName(rs.getString("memberName"));
		}
		System.out.println(paramMember.getMemberId()+""+paramMember.getMemberPw()+"login값 넘어옴");
		rs.close();
		stmt.close();	
		return resultMember;
	}
	
	public int insertMember(Connection conn, Member member) throws Exception {
		int row = 0;

		String sql = "INSERT INTO member(member_id, member_pw, member_name, updatedate, createdate)"
					+ " VALUES(?, ?, ?, sysdate, sysdate)";		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
		stmt.setString(3, member.getMemberName());
		
		row = stmt.executeUpdate();
		return row;
	}
	
	public int updateMember(Connection conn, Member member) throws Exception {
		int row = 0;

		String sql = "UPDATE member SET member_name = ?, updatedate = ? WHERE member_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberName());
		stmt.setString(2, member.getUpdatedate());
		stmt.setString(3, member.getMemberId());
			
		row = stmt.executeUpdate();
		return row;
	}
	
	public int deleteMember(Connection conn, Member member) throws Exception {
		int row = 0;

		String sql = "DELETE FROM member WHERE member_id =? AND member_pw = ?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberId());
		stmt.setString(2, member.getMemberPw());
			
		row = stmt.executeUpdate();		
		return row;
	}
}
