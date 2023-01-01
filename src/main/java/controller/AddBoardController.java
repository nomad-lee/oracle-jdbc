package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Board;
import vo.Member;
import service.BoardService;

// C -> M ===> 클라이언트 다른 컨트롤러를 요청하도록 리다이렉트
// view(jsp)파일들을 WEB-INF보안폴더안으로 이동해서 클라이언트가 View를 직접 호출 못하도록....
// list select					: C -> M -> V 
// form	페이지호출					: C -> V
// action insert/update/delete	: C -> M =====> response.sendRedirect()
@WebServlet("/board/addBoard")
public class AddBoardController extends HttpServlet {
	// 글쓰기 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 여부확인, 로그인 되어있지 않으면 홈으로 이동
		HttpSession session = request.getSession();		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/view/board/addBoardForm.jsp").forward(request, response);
	}
	
	// 글쓰기 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 로그인 여부확인, 로그인 되어있지 않으면 홈으로 이동
		HttpSession session = request.getSession();		
		Member loginMember = (Member)session.getAttribute("loginMember");		
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		String boardTitle = null;
		String boardContent = null;
		String memberId = null;
		
		boardTitle = request.getParameter("boardTitle");
		boardContent = request.getParameter("boardContent"); 
		memberId = loginMember.getMemberId();

		if(boardTitle == null || boardContent == null || "".equals(boardTitle) || "".equals(boardContent)) {
			response.sendRedirect(request.getContextPath()+"/board/addBoard?boardTitle="+boardTitle+"&boardContent="+boardContent);
			return;
		} else {
		
		Board board = new Board();
		board.setBoardTitle(boardTitle);
		board.setBoardContent(boardContent);
		board.setMemberId(memberId);
		
		// 모델호출
		BoardService boardService = new BoardService();
		boardService.insertBoardService(board);
		
		// view가 없으므로
		response.sendRedirect(request.getContextPath()+"/board/boardList");
		}
	}
}