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

@WebServlet("/board/boardOne")
public class BoardOneController extends HttpServlet {	
		/*
		 * VIEW 메뉴구성
		 * 1. 글수정(로그인멤버 == 글쓴멤버)
		 * 2. 글삭제(로그인멤버 == 글쓴멤버)
		 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardNo = 0;
		boardNo = Integer.parseInt(request.getParameter("boardNo"));

		Board board = new Board();
		BoardService boardService = new BoardService();
		board = boardService.getBoardOne(boardNo);
		
		// view와 공유할 모델 데이터 성정
		request.setAttribute("board", board);
		
		// view 연결
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/board/boardOne.jsp");
		rd.forward(request, response);
	}
}