package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.BoardDao;
import util.DBUtil;
import vo.Board;

// 서비스
// 1) 예외처리 -> db자원반납, 트랜잭션 처리
// 2) Connection객체를 dao에 넘겨주는 역활
// 3) 기타 dao안에 있어서는 안되는 비지니스로직(코드)
public class BoardService {
	private BoardDao boardDao;
	
	// boardList
	public ArrayList<Board> getBoardListByPage(int currentPage, int rowPerPage) {
		/*
		 	1) connection 생성 <- DBUtil.class
		 	2) beginRow, endRow 생성 <- currentPage,rowPerPage를 가공
		 */
		ArrayList<Board> list = null;
		Connection conn = null;
		try {
			int beginRow = (currentPage-1)*rowPerPage+1;
			int endRow = beginRow + rowPerPage - 1;			
			conn = DBUtil.getConnection();
			boardDao = new BoardDao();
			list = boardDao.selectBoardListByPage(conn, beginRow, endRow);
			conn.commit(); // DBUtil.class에서 conn.setAutoCommit(false);
		} catch (Exception e) {
			try {
				conn.rollback(); // DBUtil.class에서 conn.setAutoCommit(false);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	// boardList 검색추가
	public ArrayList<Board> getBoardListByPage(int currentPage, int rowPerPage, String word) {
		/*
		 	1) connection 생성 <- DBUtil.class
		 	2) beginRow, endRow 생성 <- currentPage,rowPerPage를 가공
		 */
		ArrayList<Board> list = null;
		Connection conn = null;
		try {
			int beginRow = (currentPage-1)*rowPerPage+1;
			int endRow = beginRow + rowPerPage - 1;
			conn = DBUtil.getConnection();
			boardDao = new BoardDao();
			list = boardDao.selectBoardListByPage(conn, beginRow, endRow, word);
			conn.commit(); // DBUtil.class에서 conn.setAutoCommit(false);
		} catch (Exception e) {
			try {
				conn.rollback(); // DBUtil.class에서 conn.setAutoCommit(false);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public Board getBoardOne(int boardNo) {
		boardDao = new BoardDao();
		Connection conn = null;
		Board board = null;
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			board = boardDao.selectBoardOne(conn, boardNo);
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return board;
	}
	// 페이징을 위한 BoardList 수 수하기
	public int cntBoardListServie() {
		int resultCnt = 0;
		boardDao = new BoardDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			resultCnt = boardDao.cntBoardList(conn);
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultCnt;
	}
	// 페이징+검색을 위한 BoardList 수 수하기
	public int cntBoardListServie(String word) {
		int resultCnt = 0;
		boardDao = new BoardDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			resultCnt = boardDao.cntBoardList(conn, word);
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return resultCnt;
	}
	
	public int insertBoardService(Board board) {
		boardDao = new BoardDao();
		Connection conn = null;
		int row = 0;
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			row = boardDao.insertBoardList(conn, board);
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	public int updateBoardService(Board board) {
		boardDao = new BoardDao();
		Connection conn = null;
		int row = 0;
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			row = boardDao.updateBoardList(conn, board);
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	public int deleteBoardService(Board board) {
		boardDao = new BoardDao();
		Connection conn = null;
		int row = 0;
		try {
			conn = DBUtil.getConnection();
			conn.setAutoCommit(false);
			row = boardDao.deleteBoardList(conn, board);
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
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return row;
	}	
}