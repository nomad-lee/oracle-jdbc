package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member/addMember")
public class AddMemberController extends HttpServlet {
	// 회원가입 폼
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * VIEW -> /WEB-INF/view/member/addMember.jsp
		 * 
		 */
	}
	// 회원가입 액션	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 로그인 세션 정보 : ex) session.setAttribute
		 * redirect -> /member/login <- 컨트롤러 요청(get방식)
		 */
		doGet(request, response);
	}

}