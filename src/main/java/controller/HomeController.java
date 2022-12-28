package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;


@WebServlet("/Home")
public class HomeController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 메뉴구성(로그인 전/후에 따라 분기)
		 * 1) 회원가입
		 * 2) 로그인
		 * 
		 * 로그인 전
		 * 1) 회원가입
		 * 2) 로그인
		 * 
		 * 로그인 후
		 * 1) 로그아웃
		 * 2) 회원정보
		 * 3) 게시판리스트
		 */
		
		// 로그인 후에만 접근가능
		HttpSession session = request.getSession();
		
		// 로그인 여부확인, 로그인 되어있지않을 경우 회원페이지로 이동
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/LoginFormController");
			return;
		}
		
		// 회원페이지(home) View
		request.getRequestDispatcher("/WEB-INF/view/home.jsp").forward(request, response);
	}
}