package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;
import vo.Board;

@WebServlet("/board/removeBoard")
public class RemoveBoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int boardNo = 0;
		boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		Board board = new Board();
		board.setBoardNo(boardNo);

	    // 모델호출
		BoardService boardService = new BoardService();
		boardService.deleteBoardService(board);
		
		// view가 없으므로
		response.sendRedirect(request.getContextPath()+"/board/boardList");
	}
}