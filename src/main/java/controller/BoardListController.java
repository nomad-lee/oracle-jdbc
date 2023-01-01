package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;

@WebServlet("/board/boardList")
public class BoardListController extends HttpServlet {
	private BoardService boardService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 여부확인, 로그인 되어있지 않으면 홈으로 이동
		HttpSession session = request.getSession();		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int rowPerPage = 10;
		if(request.getParameter("rowPerPage") != null) {
			rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		}
		
		// 총 게시글 수
		int resultCnt = 0;
		ArrayList<Board> list = null;
		String word = request.getParameter("word");
		this.boardService = new BoardService();

		if(word != null) { // 검색어가 있을 경우
			resultCnt = boardService.cntBoardListServie(word);
			list = boardService.getBoardListByPage(currentPage, rowPerPage, word);
		} else { // 검색어가 없을 경우
			resultCnt = boardService.cntBoardListServie();
			list = boardService.getBoardListByPage(currentPage, rowPerPage);
		}
		
		// 마지막 페이지
		int lastPage = resultCnt / rowPerPage;
		if(resultCnt % rowPerPage != 0) {
			lastPage++;
		}
		System.out.println("rowPerPage :" + rowPerPage);
		System.out.println("currentPage : " + currentPage);
		System.out.println("lastPage : " + lastPage);
		System.out.println("word : " + word);
		
		request.setAttribute("boardList", list);
		request.setAttribute("currentPage", currentPage); // view에서 필요
		request.setAttribute("rowPerPage", rowPerPage); // view에서 필요
		request.setAttribute("lastPage", lastPage); // view에서 필요
		request.setAttribute("word", word); // view에서 필요
		
		/*
		 * VIEW 메뉴구성
		 * 1) 글 입력
		 * 2) 글 상세보기
		 */
		
		request.getRequestDispatcher("/WEB-INF/view/board/boardList.jsp").forward(request, response);
	}
}