package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/logout")
public class LogoutController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 로그인 세션 정보 삭제 : ex) session.invalidate();
		 * redirect -> get방식
		 * 
		 */
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath()+"/home");
		System.out.println("로그아웃 완료");
	}
}