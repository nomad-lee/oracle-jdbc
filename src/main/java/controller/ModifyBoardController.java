package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import vo.Board;

@WebServlet("/board/modifyBoard")
public class ModifyBoardController extends HttpServlet {
	// 글 수정 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		boardService.updateBoardService(board);

		// view가 없으므로
		response.sendRedirect(request.getContextPath()+"/board/boardList");
	}
}
