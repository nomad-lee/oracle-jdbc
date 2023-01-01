package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.Member;

@WebServlet("/member/removeMember")
public class RemoveMemberController extends HttpServlet {
	// 회원 탈퇴 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 여부확인, 로그인 되어있지 않으면 홈으로 이동
		HttpSession session = request.getSession();		
		Member loginMember = (Member)session.getAttribute("loginMember");		
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		// view와 공유할 모델 데이터 성정
		request.setAttribute("loginMember", loginMember);
		
		// 회원페이지(home) View
		request.getRequestDispatcher("/WEB-INF/view/member/removeMember.jsp").forward(request, response);
	}
	// 회원 탈퇴 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		

		// 로그인 여부확인, 로그인 되어있지 않으면 홈으로 이동
		HttpSession session = request.getSession();		
		Member loginMember = (Member)session.getAttribute("loginMember");		
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		String memberId = null;
		String memberPw = null;	
		memberId = request.getParameter("memberId");
		memberPw = request.getParameter("memberPw");
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);

	    // 모델호출
		MemberService memberService = new MemberService();
		int returnMember = memberService.deleteMemberService(member);
		
		if(returnMember == 0) { //탈퇴 실패
			response.sendRedirect(request.getContextPath()+"/member/removeMember");
			System.out.println("탈퇴 실패");
			return;			
		} else {
			// view가 없으므로
			response.sendRedirect(request.getContextPath()+"/member/logout");
		}
	}
}