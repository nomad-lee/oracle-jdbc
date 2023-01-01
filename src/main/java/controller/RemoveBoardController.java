package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;

@WebServlet("/board/removeBoard")
public class RemoveBoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		

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
		board.setBoardNo(boardNo);

	    // 모델호출
		BoardService boardService = new BoardService();
		boardService.deleteBoardService(board);
		
		// view가 없으므로
		response.sendRedirect(request.getContextPath()+"/board/boardList");
	}
}