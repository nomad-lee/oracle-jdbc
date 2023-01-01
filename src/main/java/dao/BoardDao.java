package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import vo.Board;

public class BoardDao {
	// boardList
	public ArrayList<Board> selectBoardListByPage(Connection conn, int beginRow, int endRow) throws Exception {
		ArrayList<Board> list = new ArrayList<Board>();
		String sql = "SELECT board_no boardNo, board_title boardTitle, member_id memberId, createdate"
				+ " FROM (SELECT rownum rnum, board_no, board_title, member_id, createdate"
				+ "			FROM (SELECT board_no, board_title, member_id, createdate"
				+ "					FROM board ORDER BY to_number(board_no) DESC))"
				+ " WHERE rnum BETWEEN ? AND ?"; // WHERE rnum >=? AND rnum <=?;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, endRow);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setCreatedate(rs.getString("createdate"));
			b.setMemberId(rs.getString("memberId"));
			list.add(b);
		}
		return list;
	}
	// boarList 검색추가
	public ArrayList<Board> selectBoardListByPage(Connection conn, int beginRow, int endRow, String word) throws Exception {
		ArrayList<Board> list = new ArrayList<Board>();
		String sql = "SELECT board_no boardNo, board_title boardTitle, member_id memberId, createdate"
				+ " FROM (SELECT rownum rnum, board_no, board_title, board_content, member_id, createdate"
				+ "			FROM (SELECT board_no, board_title, board_content, member_id, createdate"
				+ "					FROM board ORDER BY to_number(board_no) DESC))"
				+ " WHERE rnum BETWEEN ? AND ? AND (board_title LIKE ? OR board_content LIKE ?)"; // WHERE rnum >=? AND rnum <=?;
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, endRow);
		stmt.setString(3, "%"+word+"%");
		stmt.setString(4, "%"+word+"%");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Board b = new Board();
			b.setBoardNo(rs.getInt("boardNo"));
			b.setBoardTitle(rs.getString("boardTitle"));
			b.setCreatedate(rs.getString("createdate"));
			b.setMemberId(rs.getString("memberId"));
			list.add(b);
		}
		return list;
	}
	
	public Board selectBoardOne (Connection conn, int boardNo) throws Exception {
		Board board = null;
		
		String sql = "SELECT board_no boardNo, board_title boardTitle, board_content boardContent, member_id memberId FROM board where board_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, boardNo);
		
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			board = new Board();
			board.setBoardNo(rs.getInt("boardNo"));
			board.setBoardTitle(rs.getString("boardTitle"));
			board.setBoardContent(rs.getString("boardContent"));
			board.setMemberId(rs.getString("memberId"));
		}		
		return board;
	}
	// 페이징을 위한 BoardList 수 수하기
	public int cntBoardList (Connection conn) throws Exception {
		int cnt = 0;
		String sql = "SELECT COUNT(*) cnt FROM board";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt("cnt");
		}		
		return cnt;	
	}
	// 페이징+검색을 위한 BoardList 수 수하기
	public int cntBoardList (Connection conn, String word) throws Exception {
		int cnt = 0;
		String sql = "SELECT COUNT(*) cnt from board WHERE board_title LIKE ? OR board_content LIKE ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+word+"%");
		stmt.setString(2, "%"+word+"%");
		
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt("cnt");
		}		
		return cnt;
	}
		
	public int insertBoardList(Connection conn, Board board) throws Exception {
		int row = 0;

		String sql = "INSERT INTO board(board_no, board_title, board_content, member_id, updatedate, createdate)"
					+ " VALUES(board_seq.nextval, ?, ?, ?, sysdate, sysdate)";		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setString(3, board.getMemberId());
		
		row = stmt.executeUpdate();
		return row;
	}
	
	public int updateBoardList(Connection conn, Board board) throws Exception {
		int row = 0;

		String sql = "UPDATE board SET board_title = ?, board_content = ?, updatedate = ? WHERE board_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, board.getBoardTitle());
		stmt.setString(2, board.getBoardContent());
		stmt.setString(3, board.getUpdatedate());
		stmt.setInt(4, board.getBoardNo());
			
		row = stmt.executeUpdate();
		return row;
	}
	public int deleteBoardList(Connection conn, Board board) throws Exception {
		int row = 0;

		String sql = "DELETE FROM board WHERE board_no = ?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, board.getBoardNo());
			
		row = stmt.executeUpdate();		
		return row;
	}
	
}