<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
</head>
<body>
	<h1>로그인</h1>
	<div class="container">
		<form action="${pageContext.request.contextPath}/member/login" method="post">
			<table class = "table">
				<tr>
					<td>아이디</td>
					<td><input type="text" class="form-control" name="memberId"></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" class="form-control" name="memberPw"></td>
				</tr>
			</table>
			<a type="btn" class="btn btn-dark" href="${pageContext.request.contextPath}/member/addMember">회원가입</a>
			<button type="submit" class="btn btn-secondary">로그인</button>
		</form>
	</div>	
</body>
</html>