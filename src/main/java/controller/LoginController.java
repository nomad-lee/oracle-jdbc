package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.net.*;
import service.MemberService;
import vo.Member;

@WebServlet("/member/login")
public class LoginController extends HttpServlet {
	// 로그인 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	// 로그인 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		private MemberService memberService;
		// 로그인 전에만 진입가능
		HttpSession session = request.getSession();
		// 로그인 전 : loginMember -> null
		// 로그인 후 : loginMember -> not null
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) { // 로그인 상태
			response.sendRedirect(request.getContextPath()+"/HomeController");
			return;
		}
		
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		
		Member paramMember = new Member();
		paramMember.setMemberId(memberId);
		paramMember.setMemberPw(memberPw);
		
		this.memberService = new MemberService();
		Member returnMember = memberService.loginService(paramMember);
				
		if(returnMember == null) { //로그인 실패
			String msg = URLEncoder.encode("아이디와 패스워드를 입력해주세요", "utf-8");
			response.sendRedirect(request.getContextPath()+"/LoginFormController");
			System.out.println("로그인 실패");
			return;
		}
		
		session.setAttribute("loginMember", returnMember);
		response.sendRedirect(request.getContextPath()+"/HomeController");
		System.out.println("로그인 성공");
	}
}
