package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;

@WebServlet("/member/memberOne")
public class MemberOneController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 *	VIEW -> /WEB-INF/view/member/memberOne.jsp
		 *	메뉴구성
		 *	1) 회원정보수정
		 *	2) 회원탈퇴
		 */
		
		// 로그인 여부확인, 로그인 되어있지 않으면 홈으로 이동
		HttpSession session = request.getSession();		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		// 회원페이지(home) View
		request.getRequestDispatcher("/WEB-INF/view/member/memberOne.jsp").forward(request, response);
	}
}