package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import vo.Member;


@WebServlet("/member/addMember")
public class AddMemberController extends HttpServlet {
	// 회원가입 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/member/addMember.jsp").forward(request, response);
	}
	// 회원가입 액션	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		
		String memberId = request.getParameter("memberId");
		String memberPw = request.getParameter("memberPw");
		String memberName = request.getParameter("memberName");
		
		if(request.getParameter("memberId") == null || request.getParameter("memberPw") == null || request.getParameter("memberName") == null
				|| request.getParameter("memberId") == "" || request.getParameter("memberPw") == "" || request.getParameter("memberName") == "") {
				String msg = URLEncoder.encode("모든 정보를 입력하세요", "utf-8"); //미입력 방지, get방식 주소창에 문자열 인코딩
				response.sendRedirect(request.getContextPath()+"/cash/cashDateList.jsp?cashNo="+cashNo+"&msg="+msg+"&year="+year+"&month="+month+"&date="+date);
				return;
			}
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		member.setMemberName(memberName);
		
		// 모델호출
		MemberService memberService = new MemberService();
		memberService.insertMemberService(member);
		
		// view가 없으므로
		response.sendRedirect(request.getContextPath()+"/home");
	}

}
