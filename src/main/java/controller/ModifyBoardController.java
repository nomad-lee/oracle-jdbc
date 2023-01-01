package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;

@WebServlet("/board/modifyBoard")
public class ModifyBoardController extends HttpServlet {
	// 글 수정 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 여부확인, 로그인 되어있지 않으면 홈으로 이동
		HttpSession session = request.getSession();		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		int boardNo = 0; 
		boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
	    Board board = new Board();
		BoardService boardService = new BoardService();
		board = boardService.getBoardOne(boardNo);

		// view와 공유할 모델데이터 설정
		request.setAttribute("board", board);
		
		// view 있으면
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/board/modifyBoardForm.jsp");		
		rd.forward(request, response);
	}
	// 글 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		// 로그인 여부확인, 로그인 되어있지 않으면 홈으로 이동
		HttpSession session = request.getSession();		
		Member loginMember = (Member)session.getAttribute("loginMember");		
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		String updatedate = request.getParameter("updatedate");
		
	    Board board = new Board();
	    board.setBoardNo(boardNo);
	    board.setBoardTitle(boardTitle);
	    board.setBoardContent(boardContent);
	    board.setUpdatedate(updatedate);
	    
	    // 모델호출
		BoardService boardService = new BoardService();
		int returnBoard = boardService.updateBoardService(board);
		
		if(returnBoard == 0) { //수정 실패
			response.sendRedirect(request.getContextPath()+"/board/modifyBoard?boardNo="+boardNo);
			System.out.println("수정 실패");
			return;
		} else {
		// view가 없으므로
		response.sendRedirect(request.getContextPath()+"/board/boardList");
		}
	}
}
