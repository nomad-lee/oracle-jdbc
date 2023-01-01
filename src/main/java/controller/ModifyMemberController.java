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

@WebServlet("/member/modifyMember")
public class ModifyMemberController extends HttpServlet {
	// 회원 수정 폼
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
		request.getRequestDispatcher("/WEB-INF/view/member/modifyMember.jsp").forward(request, response);
	}
	// 회원정보 수정 액션
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * redirect -> get방식 /member/memberOne?key값 <- 컨트롤러 요청
		 * 
		 */
		/*
		 * if(session.getAttribute("loginMember") == null) {
			// 로그인 되지 않은 상태
			String msg = URLEncoder.encode("잘못된 접근입니다", "utf-8");
			response.sendRedirect(request.getContextPath()+"/mainPage.jsp?msg="+msg);
			return;
			}
			
			request.setCharacterEncoding("utf-8");
			
			Member loginMember = (Member)session.getAttribute("loginMember");
			String memberId = request.getParameter("memberId");
			String memberName = request.getParameter("memberName");
			String memberPw = request.getParameter("memberPw");
			
			// 컨트롤러
			loginMember.setMemberId(memberId);
			loginMember.setMemberName(memberName);
			loginMember.setMemberPw(memberPw);
		
			// 분리된 모델 호출
			MemberDao memberDao = new MemberDao();
			Member updateMember = null;
			
			if((memberPw == null || "".equals(memberPw)) && (memberPw2 == null || "".equals(memberPw2))) {
				// 비밀번호 미변경
				updateMember = memberDao.updateMember(loginMember);		
				System.out.println("비번 미변경");
			} else {
				// 비밀번호 변경 시
				updateMember = memberDao.updateMemberPw(loginMember);
				System.out.println("비번 변경");
			}	
				
			if(updateMember != null){
				session.setAttribute("loginMember", loginMember);
				response.sendRedirect(request.getContextPath()+"/user.jsp");
				System.out.println(loginMember+"수정완");
				
			} else {
				response.sendRedirect(request.getContextPath()+"/user.jsp");
				System.out.println("수정실패");
			}
		 * 
		 */
		
		request.setCharacterEncoding("utf-8");

		// 로그인 여부확인, 로그인 되어있지 않으면 홈으로 이동
		HttpSession session = request.getSession();		
		Member loginMember = (Member)session.getAttribute("loginMember");		
		if(loginMember == null) {
			response.sendRedirect(request.getContextPath()+"/home");
			return;
		}
		
		String memberId = request.getParameter("memberId");
		//String memberPw = request.getParameter("memberPw");
		String memberName = request.getParameter("memberName");
		String updatedate = request.getParameter("updatedate");
		System.out.println(updatedate);
		
	    Member member = new Member();
	    member.setMemberId(memberId);
	    //member.setMemberPw(memberPw);
	    member.setMemberName(memberName);
	    member.setUpdatedate(updatedate);
	    
	    // 모델호출
		MemberService memberService = new MemberService();		
		memberService.updateMemberService(member);
		
		session.setAttribute("memberName", memberName);

		// view가 없으므로
		response.sendRedirect(request.getContextPath()+"/member/memberOne");
	}

}